import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'dart:math' as math;
import 'dart:ui' as ui;
import 'package:meta/meta.dart';

class Line {
  /// The position of the start of this line.
  Offset? position;

  /// The speed of this line.
  late double speed;

  /// The thickness of this line.
  late int thickness;

  /// The color of this line.
  Color? color;
}

enum LineDirection {
  /// Left to Right
  Ltr,

  /// Right to Left
  Rtl,

  /// Top to Bottom
  Ttb,

  /// Bottom to Top
  Btt,
}

/// Renders moving lines on an [AnimatedBackground].
class RainBehaviour extends Behaviour {
  static final math.Random random = math.Random();

  /// Creates a new racing lines behaviour
  RainBehaviour({this.direction = LineDirection.Ltr, int numLines = 50, required Color color})
      : assert(numLines >= 0) {
    _numLines = numLines;
    _color = color;
  }

  /// The list of lines used by the behaviour to hold the spawned lines.
  @protected
  List<Line>? lines;

  int? _numLines;
  Color? _color;

  /// Gets the number of lines in the background.
  int? get numLines => _numLines;
  Color? get color => _color;

  /// Sets the number of lines in the background.
  set numLines(value) {
    if (isInitialized) {
      if (value > lines!.length)
        lines!.addAll(generateLines(value - lines!.length));
      else if (value < lines!.length)
        lines!.removeRange(0, lines!.length - value as int);
    }
    _numLines = value;
  }

  /// The direction in which the lines should move
  ///
  /// Changing this will cause all lines to move in this direction, but no
  /// animation will be performed to change the direction. The lines will
  @protected
  LineDirection direction;

  /// Generates an amount of lines and initializes them.
  @protected
  List<Line> generateLines(int numLines) => List<Line>.generate(numLines, (i) {
    final Line line = Line();
    initLine(line);
    return line;
  });

  /// Initializes a line for this behaviour.
  @protected
  void initLine(Line line) {
    line.speed = random.nextDouble() * 400 + 200;

    final bool axisHorizontal =
    (direction == LineDirection.Ltr || direction == LineDirection.Rtl);
    final bool normalDirection =
    (direction == LineDirection.Ltr || direction == LineDirection.Ttb);
    final double sizeCrossAxis = axisHorizontal ? size!.height : size!.width;
    final double sizeMainAxis = axisHorizontal ? size!.width : size!.height;
    final double spawnCrossAxis = random.nextInt(100) * (sizeCrossAxis / 100);
    double spawnMainAxis = 0.0;

    if (line.position == null) {
      spawnMainAxis = random.nextDouble() * sizeMainAxis;
    } else {
      spawnMainAxis = normalDirection
          ? (-line.speed / 2.0)
          : (sizeMainAxis + line.speed / 2.0);
    }

    line.position = axisHorizontal
        ? Offset(spawnMainAxis, spawnCrossAxis)
        : Offset(spawnCrossAxis, spawnMainAxis);
    line.thickness = random.nextInt(2) + 2;
    line.color = color;
  }

  @override
  void init() {
    lines = generateLines(numLines!);
  }

  @override
  void initFrom(Behaviour oldBehaviour) {
    if (oldBehaviour is RainBehaviour) {
      lines = oldBehaviour.lines;
      numLines = this._numLines; // causes the lines to update
    }
  }

  @override
  bool get isInitialized => lines != null;

  @override
  void paint(PaintingContext context, Offset offset) {
    Canvas canvas = context.canvas;
    Paint paint = Paint()..strokeCap = StrokeCap.round;
    final bool axisHorizontal =
    (direction == LineDirection.Ltr || direction == LineDirection.Rtl);
    final int sign =
    (direction == LineDirection.Ltr || direction == LineDirection.Ttb)
        ? 1
        : -1;
    for (var line in lines!) {
      final tailDirection = axisHorizontal
          ? Offset(sign * line.speed / 2.0, 0.0)
          : Offset(0.0, sign * line.speed / 2.0);
      final headDelta =
      axisHorizontal ? Offset(20.0 * sign, 0.0) : Offset(0.0, 20.0 * sign);
      final target = line.position! + tailDirection;
      paint
        ..shader = ui.Gradient.linear(line.position!, target - headDelta,
            <Color>[line.color!.withAlpha(0), line.color!])
        ..strokeWidth = line.thickness.toDouble();
      canvas.drawLine(line.position!, target, paint);
    }
  }

  @override
  bool tick(double delta, Duration elapsed) {
    final bool axisHorizontal =
    (direction == LineDirection.Ltr || direction == LineDirection.Rtl);
    final int sign =
    (direction == LineDirection.Ltr || direction == LineDirection.Ttb)
        ? 1
        : -1;
    if (axisHorizontal) {
      for (var line in lines!) {
        line.position =
            line.position!.translate(delta * line.speed * sign, 0.0);
        if ((direction == LineDirection.Ltr &&
            line.position!.dx > size!.width) ||
            (direction == LineDirection.Rtl && line.position!.dx < 0))
          initLine(line);
      }
    } else {
      for (var line in lines!) {
        line.position =
            line.position!.translate(0.0, delta * line.speed * sign);
        if ((direction == LineDirection.Ttb &&
            line.position!.dy > size!.height) ||
            (direction == LineDirection.Btt && line.position!.dy < 0))
          initLine(line);
      }
    }
    return true;
  }
}

/// A widget that renders an animated background.
class AnimatedBackground extends RenderObjectWidget {
  /// The child widget that is rendered on top of the background
  final Widget child;

  /// The ticker provider that provides the tick to update the background
  final TickerProvider vsync;

  /// The behaviour used to render the particles
  final Behaviour behaviour;

  /// Creates a new animated background with the provided arguments
  AnimatedBackground({
    Key? key,
    required this.child,
    required this.vsync,
    required this.behaviour,
  }) : super(key: key);

  @override
  createRenderObject(BuildContext context) => RenderAnimatedBackground(
    vsync: vsync,
    behaviour: behaviour,
  );

  @override
  void updateRenderObject(
      BuildContext context, RenderAnimatedBackground renderObject) {
    renderObject..behaviour = behaviour;
  }

  @override
  _AnimatedBackgroundElement createElement() =>
      _AnimatedBackgroundElement(this);
}

class _AnimatedBackgroundElement extends RenderObjectElement {
  _AnimatedBackgroundElement(AnimatedBackground widget) : super(widget);

  @override
  AnimatedBackground get widget => super.widget as AnimatedBackground;

  @override
  RenderAnimatedBackground get renderObject =>
      super.renderObject as RenderAnimatedBackground;

  Element? _child;

  @override
  void forgetChild(Element child) {
    super.forgetChild(child);
    assert(child == _child);
    _child = null;
  }

  @override
  void insertRenderObjectChild(RenderObject child, slot) {
    final RenderObjectWithChildMixin<RenderObject> renderObject =
        this.renderObject;
    assert(slot == null);
    assert(renderObject.debugValidateChild(child));
    renderObject.child = child;
    assert(renderObject == this.renderObject);
  }

  @override
  void moveRenderObjectChild(RenderObject child, oldSlot, newSlot) {
    assert(false);
  }
  @override
  void removeRenderObjectChild(RenderObject child, slot) {
    final RenderAnimatedBackground renderObject = this.renderObject;
    assert(renderObject.child == child);
    renderObject.child = null;
    assert(renderObject == this.renderObject);
  }

  @override
  void visitChildren(ElementVisitor visitor) {
    if (_child != null) visitor(_child!);
  }

  @override
  void mount(Element? parent, newSlot) {
    super.mount(parent, newSlot);
    renderObject.callback = _layoutCallback;
  }

  @override
  void update(AnimatedBackground newWidget) {
    assert(widget != newWidget);
    super.update(newWidget);
    assert(widget == newWidget);
    renderObject.callback = _layoutCallback;
    renderObject.markNeedsLayout();
  }

  @override
  void performRebuild() {
    renderObject.markNeedsLayout();
    super.performRebuild();
  }

  @override
  void unmount() {
    renderObject.callback = null;
    super.unmount();
  }

  void _layoutCallback(BoxConstraints constraints) {
    owner!.buildScope(this, () {
      Widget built;
      try {
        built = widget.behaviour.builder(this, constraints, widget.child);
        debugWidgetBuilderValue(widget, built);
      } catch (e, stack) {
        built = ErrorWidget.builder(_debugReportException(
          'building $widget',
          e,
          stack,
        ));
      }

      try {
        _child = updateChild(_child, built, null);
        assert(_child != null);
      } catch (e, stack) {
        built = ErrorWidget.builder(_debugReportException(
          'building $widget',
          e,
          stack,
        ));
        _child = updateChild(null, built, slot);
      }
    });
  }

  final bool _useDiagnosticsNode = FlutterError('text') is Diagnosticable;

  dynamic _safeContext(String context) {
    return _useDiagnosticsNode ? DiagnosticsNode.message(context) : context;
  }

  FlutterErrorDetails _debugReportException(
      String context,
      exception,
      StackTrace stack,
      ) {
    final FlutterErrorDetails details = FlutterErrorDetails(
      exception: exception,
      stack: stack,
      library: 'animated background library',
      context: _safeContext(context),
    );

    FlutterError.reportError(details);
    return details;
  }
}

/// An animated background in the render tree.
class RenderAnimatedBackground extends RenderProxyBox {
  int _lastTimeMs = 0;
  TickerProvider _vsync;
  late Ticker _ticker;

  Behaviour _behaviour;

  /// Gets the behaviour used by this animated background.
  Behaviour get behaviour => _behaviour;

  /// Set the behaviour used by this animated background.
  set behaviour(value) {
    assert(value != null);
    Behaviour oldBehaviour = _behaviour;
    _behaviour = value;

    _behaviour.renderObject = this;
    _behaviour.initFrom(oldBehaviour);
  }

  /// Gets the layout callback that should be called when performing layout.
  LayoutCallback<BoxConstraints> get callback => _callback!;
  LayoutCallback<BoxConstraints>? _callback;

  /// Sets the layout callback that should be called when performing layout.
  set callback(LayoutCallback<BoxConstraints>? value) {
    if (value == _callback) return;
    _callback = value;
    markNeedsLayout();
  }

  /// Creates a new render for animated background with the provided arguments.
  RenderAnimatedBackground({
    required TickerProvider vsync,
    required Behaviour behaviour,
  })   : _vsync = vsync,
        _behaviour = behaviour {
    _behaviour.renderObject = this;
  }

  @override
  void attach(PipelineOwner owner) {
    _lastTimeMs = 0;
    _ticker = _vsync.createTicker(_tick);
    _ticker.start();
    super.attach(owner);
  }

  @override
  void detach() {
    _ticker.dispose();
    super.detach();
  }

  void _tick(Duration elapsed) {
    if (!_behaviour.isInitialized) return;

    double delta = (elapsed.inMilliseconds - _lastTimeMs) / 1000.0;
    _lastTimeMs = elapsed.inMilliseconds;

    if (_behaviour.tick(delta, elapsed)) markNeedsPaint();
  }

  @override
  void performLayout() {
    invokeLayoutCallback(callback);
    if (child != null) child!.layout(constraints, parentUsesSize: true);
    size = constraints.biggest;
  }

  @override
  paint(PaintingContext context, Offset offset) {
    if (!behaviour.isInitialized) behaviour.init();

    Canvas canvas = context.canvas;
    canvas.translate(offset.dx, offset.dy);
    behaviour.paint(context, offset);
    canvas.translate(-offset.dx, -offset.dy);

    super.paint(context, offset);
  }
}

/// Base class for behaviours provided to [AnimatedBackground]
///
/// Implementing this class allows to render new types of backgrounds.
abstract class Behaviour {
  /// The render object of the [AnimatedBackground] this behaviour is provided to.
  @protected
  RenderAnimatedBackground? renderObject;

  /// The size of the render object of the [AnimatedBackground] this behaviour is provided to.
  @protected
  Size? get size => renderObject?.size;

  /// Gets the initialization state of this behaviour
  bool get isInitialized;

  /// Called when this behaviour should be initialized
  ///
  /// After calling this method any call to [isInitialized] should return true.
  @protected
  void init();

  /// Called when this behaviour should be initialized from an old behaviour.
  @protected
  void initFrom(Behaviour oldBehaviour);

  /// Called each time there is an update from the ticker on the [AnimatedBackground]
  ///
  /// The implementation must return true if there is a need to repaint and
  /// false otherwise.
  @protected
  bool tick(double delta, Duration elapsed);

  /// Called each time the [AnimatedBackground] needs to repaint.
  ///
  /// The canvas provided in the context is already offset by the amount
  /// specified in [offset], however the parameter is provided to make the
  /// signature of the methods uniform.
  @protected
  void paint(PaintingContext context, Offset offset);

  /// Called when the layout needs to be rebuilt.
  ///
  /// Allows the behaviour to include new widgets between the background and
  /// the provided child. (ie. include a [GestureDetector] to make the
  /// background interactive.
  @protected
  @mustCallSuper
  Widget builder(
      BuildContext context,
      BoxConstraints constraints,
      Widget child,
      ) {
    return child;
  }
}

/// Empty Behaviour that renders nothing on an [AnimatedBackground]
class EmptyBehaviour extends Behaviour {
  static EmptyBehaviour? _empty;

  EmptyBehaviour._();

  factory EmptyBehaviour() => _empty ?? (_empty = EmptyBehaviour._());

  @override
  void init() {}

  @override
  void initFrom(Behaviour oldBehaviour) {}

  @override
  bool get isInitialized => true;

  @override
  void paint(PaintingContext context, Offset offset) {}

  @override
  bool tick(double delta, Duration elapsed) => false;
}
