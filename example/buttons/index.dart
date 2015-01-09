import 'dart:html' as html;
import 'package:route/client.dart';
import 'package:liquid/liquid.dart';
import 'package:liquid/vdom.dart' as v;
import 'package:inkwave/inkwave.dart' as ink;
import 'package:vcss/browser.dart' as css;

class ApplicationStyleSheet extends css.StyleSheet {
  const ApplicationStyleSheet();

  static const instance = const ApplicationStyleSheet();

  final require = const [
      ink.MainStyleSheet.instance,
      ink.FlatButton.css,
      ink.RaisedButton.css,
      ink.IconButton.css,
      ink.Fab.css,
      ink.RadioButton.css,
      ink.CheckBox.css
    ];

  final icons = const [ink.iconComment, ink.iconMenu];

  build(_) => [
      css.rule('.raised1', [
        css.background(ink.paletteBlue.colors[ink.Palette.P500]),
        css.color(ink.white),
        css.margin('40px')
      ]),
    ];
}

class Application extends Component {
  static const int buttonPage = 0;

  @property(required: true) int page = 0;

  build() {
    return v.root(type: 'container')([
      ink.flatButton(type: 'flat1')(v.div()('Subject Title')),
      ink.raisedButton(type: 'raised1')(v.div()('Subject Title')),
      ink.fab(icon: ink.iconComment, type: 'fab1'),
      ink.iconButton(icon: ink.iconMenu, type: 'icon1'),
      ink.radioButton(type: 'radio1'),
      ink.checkBox(type: 'checkBox1')
    ]);
  }
}


void main() {
  final app = new Application();
  final cssManager = new css.StyleSheetManager(const ink.ThemedBuilder());

  final router = new Router()
    ..addHandler(new UrlPattern(r'/'), (_) {
      app.page = Application.buttonPage;
      app.invalidate();
    })
    ..listen();
  cssManager.include([ApplicationStyleSheet.instance]);

  injectComponent(app, html.document.body);
}
