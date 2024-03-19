import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor_flutter/common/common_fun.dart';
import 'package:doctor_flutter/common/custom_ui.dart';
import 'package:doctor_flutter/generated/l10n.dart';
import 'package:doctor_flutter/model/doctorProfile/registration/registration.dart';
import 'package:doctor_flutter/model/review/review.dart';
import 'package:doctor_flutter/utils/color_res.dart';
import 'package:doctor_flutter/utils/const_res.dart';
import 'package:doctor_flutter/utils/font_res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewPage extends StatelessWidget {
  final List<ReviewData>? reviewData;
  final DoctorData? doctorData;
  final ScrollController reviewScrollController;

  const ReviewPage({
    Key? key,
    this.reviewData,
    this.doctorData,
    required this.reviewScrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: ColorRes.snowDrift,
          width: double.infinity,
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Text(
                '${doctorData?.rating ?? 0.0}',
                style: const TextStyle(
                    fontSize: 29,
                    color: ColorRes.davyGrey,
                    fontFamily: FontRes.light),
              ),
              const SizedBox(
                height: 5,
              ),
              RatingBarIndicator(
                rating: doctorData?.rating?.toDouble() ?? 0.0,
                itemBuilder: (context, index) => const Icon(
                  Icons.star_rounded,
                  color: ColorRes.fadedOrange,
                ),
                itemCount: 5,
                itemSize: 25,
                direction: Axis.horizontal,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                '${reviewData?.length ?? 0} ${S.current.ratings}',
                style: const TextStyle(
                    fontSize: 14,
                    color: ColorRes.davyGrey,
                    fontFamily: FontRes.light),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        ListView.builder(
          controller: reviewScrollController,
          primary: false,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemCount: reviewData?.length ?? 0,
          itemBuilder: (context, index) {
            ReviewData? data = reviewData?[index];
            return Container(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 7),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipOval(
                        child: CachedNetworkImage(
                          imageUrl:
                              '${ConstRes.itemBaseURL}${data?.user?.profileImage}',
                          width: 55,
                          height: 55,
                          fit: BoxFit.cover,
                          errorWidget: (context, error, stackTrace) {
                            return CustomUi.userPlaceHolder(
                                height: 55, male: data?.user?.gender ?? 0);
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    data?.user?.fullname ?? S.current.unKnown,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontFamily: FontRes.bold,
                                      color: ColorRes.davyGrey,
                                    ),
                                  ),
                                ),
                                Text(
                                  CommonFun.timeAgo(DateTime.parse(
                                          data?.createdAt ?? '2023-03-01')
                                      .toLocal()),
                                  style: const TextStyle(
                                      fontSize: 13,
                                      color: ColorRes.silverChalice,
                                      fontFamily: FontRes.medium),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            RatingBarIndicator(
                              rating: data?.rating?.toDouble() ?? 0.0,
                              itemBuilder: (context, index) => const Icon(
                                Icons.star_rounded,
                                color: ColorRes.fadedOrange,
                              ),
                              itemCount: 5,
                              itemSize: 20,
                              direction: Axis.horizontal,
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Text(
                              data?.comment ?? '',
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: ColorRes.mediumGrey,
                                  fontFamily: FontRes.regular),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    thickness: 1,
                  )
                ],
              ),
            );
          },
        )
      ],
    );
  }
}
