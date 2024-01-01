import 'package:fic10_cbt/core/assets/assets.gen.dart';
import 'package:fic10_cbt/core/components/search_input.dart';
import 'package:fic10_cbt/core/constants/colors.dart';
import 'package:fic10_cbt/core/extensions/build_context_ext.dart';
import 'package:flutter/material.dart';

class HeaderHome extends StatelessWidget {
  const HeaderHome({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();

    return Container(
      margin: const EdgeInsets.all(12.0),
      padding: const EdgeInsets.all(24.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        color: AppColors.primary,
      ),
      child: Column(children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(50.0)),
              child: Image.network(
                'https://i.pravatar.cc/200',
                height: 64.0,
                width: 64.0,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 16.0,
            ),
            SizedBox(
              width: context.deviceWidth - 208.0,
              child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Endros',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ]),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: Container(
                height: 40.0,
                width: 40.0,
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                  color: AppColors.white.withOpacity(0.3),
                ),
                child: Assets.icons.notification.image(),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 40.0,
        ),
        SearchInput(
          controller: searchController,
          onChanged: (value) {},
        )
      ]),
    );
  }
}
