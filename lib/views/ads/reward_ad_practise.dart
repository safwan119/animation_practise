import 'package:animation_practise/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class RewardAdPractise extends StatefulWidget {
  const RewardAdPractise({super.key});

  @override
  State<RewardAdPractise> createState() => _RewardAdPractiseState();
}

class _RewardAdPractiseState extends State<RewardAdPractise> {
  RewardedAd? _rewardedAd;

  @override
  void initState() {
    super.initState();
    _loadRewardAd();
  }

  @override
  void dispose() {
    _rewardedAd?.dispose();
    super.dispose();
  }

  void _loadRewardAd() {
    RewardedAd.load(
      adUnitId: AppStrings.rewardAdUnitId,
      request: AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          // Called when an ad is successfully received.
          debugPrint('Ad was loaded.');
          // Keep a reference to the ad so you can show it later.
          _rewardedAd = ad;
        },
        onAdFailedToLoad: (error) {
          debugPrint('Ad failed to load with error: $error');
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => _rewardedAd?.show(
          onUserEarnedReward: (ad, reward) {
            debugPrint('Reward amount: ${reward.amount}');
          },
        ),
        child: Icon(Icons.slideshow_outlined),
      ),

      appBar: AppBar(title: Text("Reward ad")),
    );
  }
}
