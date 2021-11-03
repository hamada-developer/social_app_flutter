import 'package:flutter/material.dart';
import 'package:social_app/style/colors/app_colors.dart';
import 'package:social_app/style/icon_broken.dart';

class PostsListView extends StatelessWidget {
  const PostsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return _itemPost();
      },
      itemCount: 50,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }

  Widget _itemPost() {
    return Card(
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 28,
                  backgroundImage: NetworkImage(
                    'https://images.ctfassets.net/hrltx12pl8hq/7yQR5uJhwEkRfjwMFJ7bUK/dc52a0913e8ff8b5c276177890eb0129/offset_comp_772626-opt.jpg?fit=fill&w=800&h=300',
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text('Hamada Mohamed'),
                        const SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.check_circle,
                          color: AppColors.primaryColor,
                          size: 16,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text('2021-11-01'),
                  ],
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_horiz_rounded,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'hamada hamada hamada hamada.devlop@gmail.com '
              'hamada hamada hamada hamada hamada hamadahamada hamada hamada hamada'
              '.devlop@gmail.com hamada hamada hamada hamada hamada hamadahamada hamada hamada hamada'
              '.devlop@gmail.com hamada hamada hamada hamada hamada hamadahamada hamada hamada hamada.devlop@'
              'gmail.com hamada hamada hamada hamada hamada'
              ' hamadahamada hamada hamada hamada.devlop@'
              'gmail.com hamada hamada hamada hamada hamada hamadahamada hamada hamada hamada.devlop@gmail.com hamada hamada hamada hamada hamada hamadahamada hamada hamada hamada.devlop@gmail.com hamada hamada hamada hamada hamada hamadahamada hamada hamada hamada.devlop@gmail.com hamada hamada hamada hamada hamada hamadahamada hamada hamada hamada.devlop@gmail.com hamada hamada hamada hamada hamada hamadahamada hamada hamada hamada.devlop@gmail.com hamada hamada hamada hamada hamada hamada hamada hamada',
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text('#Flutter'),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('#Software'),
                ),
              ],
            ),
            Image.network(
              'https://images.ctfassets.net/hrltx12pl8hq/7yQR5uJhwEkRfjwMFJ7bUK/dc52a0913e8ff8b5c276177890eb0129/offset_comp_772626-opt.jpg?fit=fill&w=800&h=300',
              height: 150,
              fit: BoxFit.cover,
            ),
            Row(
              children: [
                const Icon(
                  IconBroken.Heart,
                  color: Colors.red,
                ),
                const SizedBox(
                  width: 8,
                ),
                const Text(
                  '120',
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    IconBroken.Chat,
                    color: Colors.amber,
                  ),
                ),
                const Text(
                  '120 comments',
                ),
              ],
            ),
            Row(
              children: const [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                    'https://images.ctfassets.net/hrltx12pl8hq/7yQR5uJhwEkRfjwMFJ7bUK/dc52a0913e8ff8b5c276177890eb0129/offset_comp_772626-opt.jpg?fit=fill&w=800&h=300',
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  'write a comments ...',
                  maxLines: 5,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Spacer(),
                Icon(
                  IconBroken.Heart,
                  color: Colors.red,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  'Like',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
