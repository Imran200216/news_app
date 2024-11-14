import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/components/custom_cached_network_image.dart';
import 'package:news_app/constants/colors.dart';
import 'package:news_app/provider/book_mark_provider.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter_tts/flutter_tts.dart';

class NewsDescriptionScreen extends StatefulWidget {
  final String newsImgUrl;
  final String newsTitle;
  final String newsDescription;
  final String newsByAuthor;
  final String newsContent;

  const NewsDescriptionScreen({
    super.key,
    required this.newsImgUrl,
    required this.newsTitle,
    required this.newsDescription,
    required this.newsByAuthor,
    required this.newsContent,
  });

  @override
  _NewsDescriptionScreenState createState() => _NewsDescriptionScreenState();
}

class _NewsDescriptionScreenState extends State<NewsDescriptionScreen> {
  final FlutterTts _flutterTts = FlutterTts();

  @override
  void initState() {
    super.initState();
    _flutterTts.setCompletionHandler(() {
      // When TTS is completed, close the dialog
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    /// book mark provider
    final bookMarkProvider = Provider.of<BookMarkProvider>(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.secondaryColor,
        appBar: AppBar(
          backgroundColor: AppColors.secondaryColor,

          /// back button
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 24,
              color: AppColors.subTitleTextColor,
            ),
          ),
          actions: [
            /// share btn
            IconButton(
              onPressed: () async {
                await Share.share(widget.newsContent);
              },
              icon: const Icon(
                Icons.share,
                size: 24,
                color: AppColors.subTitleTextColor,
              ),
            ),
            const SizedBox(width: 8),

            /// voice button (Text-to-Speech)
            IconButton(
              onPressed: () {
                _speak(
                    widget.newsContent); // Call the speak function when pressed
              },
              icon: const Icon(
                Icons.multitrack_audio,
                size: 24,
                color: AppColors.subTitleTextColor,
              ),
            ),
            const SizedBox(width: 8),

            // /// bookmark icon button
            // IconButton(
            //   onPressed: () {
            //     final articleData = {
            //       'newsImgUrl': widget.newsImgUrl,
            //       'newsTitle': widget.newsTitle,
            //       'newsDescription': widget.newsDescription,
            //       'newsByAuthor': widget.newsByAuthor,
            //       'newsContent': widget.newsContent,
            //       'timestamp': FieldValue.serverTimestamp(),
            //     };
            //
            //     bookMarkProvider.addBookmark(articleData, context);
            //   },
            //   icon: Icon(
            //     bookMarkProvider.isBookmarked(articleId) ? Icons.bookmark : Icons.bookmark_border, // Change icon based on bookmarked state
            //     size: 24,
            //     color: bookMarkProvider.isBookmarked(articleId) ? Colors.blue : AppColors.subTitleTextColor, // Change color based on bookmarked state
            //   ),
            // ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// news image
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CustomCachedImage(
                    height: 280,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    imageUrl: widget.newsImgUrl,
                    errorIconSize: 20,
                    errorIconColor: AppColors.primaryColor,
                    loadingIconColor: AppColors.primaryColor,
                    loadingIconSize: 20,
                  ),
                ),
                const SizedBox(height: 20), // Add space between image and chip

                /// Chip with background color and text color from AppColors
                const Chip(
                  label: Text(
                    'Politics', // Example category
                    style: TextStyle(
                      color: AppColors.secondaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                    side: BorderSide(
                      color: AppColors.secondaryColor,
                    ),
                  ),
                  backgroundColor: AppColors.primaryColor, // Background color
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                ),
                const SizedBox(height: 20),

                // Title
                Text(
                  textAlign: TextAlign.start,
                  widget.newsTitle,
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    color: AppColors.titleTextColor,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 20),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Author - ",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: AppColors.subTitleTextColor,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      widget.newsByAuthor,
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        color: AppColors.titleTextColor,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Description
                Text(
                  textAlign: TextAlign.start,
                  widget.newsDescription,
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    color: AppColors.titleTextColor,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 20),

                // Content (this will be read aloud)
                Text(
                  textAlign: TextAlign.start,
                  widget.newsContent,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColors.subTitleTextColor,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Function to handle text-to-speech
  Future _speak(String text) async {
    // Show loading dialog while speaking
    showDialog(
      context: context,
      barrierDismissible: false,
      // Disable dismissing the dialog by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/images/svg/audio-icon.svg",
                color: AppColors.primaryColor,
                height: 22,
                width: 22,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 10),
              const Text(
                "Speaking...",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryColor,
                  fontSize: 22,
                ),
              ), // Display the text
            ],
          ),
        );
      },
    );

    // Set up the TTS configuration
    await _flutterTts.setLanguage("en-US");
    await _flutterTts.setSpeechRate(0.5); // Speed of speech
    await _flutterTts.setVolume(1.0); // Volume
    await _flutterTts.setPitch(1.0); // Pitch of speech
    await _flutterTts.speak(text); // Speak the text
  }
}
