import 'package:cryptoapp/sizing/dynamic_widget_builder.dart';
import 'package:cryptoapp/sizing/sizing_information.dart';
import 'package:cryptoapp/theme/colors.dart';
import 'package:cryptoapp/theme/text_styles.dart';
import 'package:cryptoapp/widgets/containers/background_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Information screen shown in the intro slides
class InformationScreen extends StatelessWidget {

  // Inherited Variables
  final String title;
  final String imagePath; // File path of the image asset
  final int pageNumber;
  final StatelessWidget nextScreen;

  InformationScreen({
    required this.title,
    required this.imagePath,
    required this.pageNumber,
    required this.nextScreen
  });

  // Sizing Specifications (in % of screen width (because that's the smaller limit))
  static const IMAGE_SCALE = 0.8;
  static const TITLE_SCALE = .4;
  static const DESCRIPTION_SCALE = .3;
  static const NEXT_BUTTON_SCALE = 0.15;

  Container _getCircularContainer(Color color, double diameter, Widget childWidget) {
    return Container(
      width: diameter,
      height: diameter,
      decoration:
      BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Center(child: childWidget)
    );
  }

  RichText _getDescription(fontSize) {

    TextStyle textStyle = GoogleFonts.karla(height: 1.8, fontWeight: FontWeight.normal, color: SECONDARY_TEXT_COLOR, fontSize: fontSize);
    TextStyle boldTextStyle = GoogleFonts.karla(height: 1.8, fontWeight: FontWeight.bold, color: SECONDARY_TEXT_COLOR, fontSize: fontSize);

    List<List<TextSpan>> descriptions = [
      
      // Our Community
      <TextSpan>[
        new TextSpan(text: 'Against the millionaires in crypto', style: textStyle),
        new TextSpan(text: '\nnone of us can compete alone', style: boldTextStyle),
        new TextSpan(text: '\n\nSo we are ', style: textStyle),
        new TextSpan(text: 'pooling our resources', style: boldTextStyle),
        new TextSpan(text: '\nto get ', style: textStyle),
        new TextSpan(text: 'our share of the profit', style: boldTextStyle)
      ],

      // Join Events
      <TextSpan>[
        new TextSpan(text: 'Join investing events with', style: textStyle),
        new TextSpan(text: '\nhundreds of other users', style: boldTextStyle),
        new TextSpan(text: '\n\nYou pool your money and invest in ', style: textStyle),
        new TextSpan(text: '\nthe hottest cryptos, NFTs, and more', style: boldTextStyle),
      ],

      // Make Bank
      <TextSpan>[
        new TextSpan(text: 'Events last a certain time period', style: textStyle),
        new TextSpan(text: '\nas the assets are invested and grow', style: textStyle),
        new TextSpan(text: '\n\nAnd after the event finishes', style: textStyle),
        new TextSpan(text: '\nyour profit goes straight to your virtual wallet', style: boldTextStyle),
      ],

      // Get Rewards
      <TextSpan>[
        new TextSpan(text: 'We reward you for investing ', style: textStyle),
        new TextSpan(text: '\nand completing the #goals', style: boldTextStyle),
        new TextSpan(text: '\n\nEach level-up you get a reward', style: textStyle),
        new TextSpan(text: '\nsuch as an NFT from a local artist', style: boldTextStyle),
      ],

      // Let's Get Started
      <TextSpan>[
        new TextSpan(text: 'Make your account and then', style: textStyle),
        new TextSpan(text: '\nwe need you to make a \'Meta Mask\' account', style: textStyle),
        new TextSpan(text: '\nbut it\'s not too hard, and we\'ll be there to help you out', style: textStyle),
      ],
    ];


    List<TextSpan> textSpanChildren = descriptions[pageNumber-1];

    return RichText(
      text: new TextSpan(children: textSpanChildren),
    );

  }

  Widget _getBody(SizingInformation sizingInformation, BuildContext context) {

    // Define the screen size variables
    double screenWidth = sizingInformation.screenSize.width;
    double imageSize = screenWidth * IMAGE_SCALE;
    double nextButtonSize = screenWidth * NEXT_BUTTON_SCALE;
    double pageCountSize = nextButtonSize / 2;

    double titleFontSize = (screenWidth / 10).ceil().toDouble();
    double descriptionFontSize = (screenWidth / 22).ceil().toDouble();

    // Define the internal widgets
    SizedBox imageWidget = SizedBox(
        child: SvgPicture.asset(
          imagePath,
          placeholderBuilder: (context) => Icon(Icons.error),
          height: imageSize,
        ),
    );

    Container titleWidget = Container(
      child: Text(title, style: GoogleFonts.lato(fontWeight: FontWeight.w900, color: PRIMARY_TEXT_COLOR, fontSize:  titleFontSize),),
    );

    Container descriptionWidget = Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      width: screenWidth,
      child: Align(alignment: Alignment.centerLeft, child: _getDescription(descriptionFontSize)),
    );

    Container nextButton = _getCircularContainer(
        NEXT_BUTTON_COLOR,
        nextButtonSize,
        IconButton(
          icon: Icon(Icons.chevron_right_rounded, color: Colors.white,),
          iconSize: nextButtonSize / 1.5,
          onPressed: () {
            Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeftWithFade, child: nextScreen));
          },
      ));

    Color prevPageCountColor = INFO_PAGE_NUMBER_COLOR;
    Color prevPageTextColor = PRIMARY_TEXT_COLOR;
    Color nextPageCountColor = INFO_PAGE_NUMBER_COLOR;
    Color nextPageTextColor = PRIMARY_TEXT_COLOR;

    // For the first page, only show the nextPageCount
    if (pageNumber == 1) {
      prevPageCountColor = Colors.transparent;
      prevPageTextColor = Colors.transparent;
    } else if (pageNumber == 5) {
      nextPageCountColor = Colors.transparent;
      nextPageTextColor = Colors.transparent;
    }

    Container prevPageCount = _getCircularContainer(
      prevPageCountColor,
      pageCountSize,
      Text("${pageNumber - 1}", style: GoogleFonts.lato(color: prevPageTextColor, fontWeight: FontWeight.bold),)
    );

    Container nextPageCount = _getCircularContainer(
        nextPageCountColor,
        pageCountSize,
        Text("${pageNumber + 1}", style: GoogleFonts.lato(color: nextPageTextColor, fontWeight: FontWeight.bold),)
    );

    Row nextDisplay = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        prevPageCount,
        SizedBox(width: 20,),
        nextButton,
        SizedBox(width: 20,),
        nextPageCount
      ],
    );

    return Column(
      children: [
        imageWidget,
        titleWidget,
        SizedBox(height: 20,),
        descriptionWidget,
        Expanded(child: nextDisplay)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return DynamicWidgetBuilder(
        builder: (context, sizingInformation) {
          return BackgroundContainer(
            child: _getBody(sizingInformation, context),
          );
        }
    );
  }

}