import 'package:animation_practise/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class InterstitialAdPractise extends StatefulWidget {
  const InterstitialAdPractise({super.key});

  @override
  State<InterstitialAdPractise> createState() => _InterstitialAdPractiseState();
}

class _InterstitialAdPractiseState extends State<InterstitialAdPractise> {
  InterstitialAd? _interstitialAd;

  @override
  void initState() {
    super.initState();
    _loadAd();
  }

  @override
  void dispose() {
    _interstitialAd?.dispose();
    super.dispose();
  }

  void _loadAd() {
    InterstitialAd.load(
      adUnitId: AppStrings.interstitialAdUnitId,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          // Called when an ad is successfully received.
          debugPrint('Ad was loaded.');
          // Keep a reference to the ad so you can show it later.
          _interstitialAd = ad;
        },
        onAdFailedToLoad: (error) {
          // Called when an ad request failed.
          debugPrint('Ad failed to load with error: $error');
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => _interstitialAd?.show(),
        child: Icon(Icons.slideshow_outlined),
      ),
      appBar: AppBar(title: Text("Interstitial ad")),
    );
  }
}
