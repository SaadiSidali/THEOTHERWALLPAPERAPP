import './models/wallpaper.dart';
import './models/category.dart';

const DUMMY_CATEGORIES = const [
  Category(
      id: 'c1',
      name: 'Animals',
      imageUrl: 'https://cdn.pixabay.com/photo/2019/08/28/09/04/cat-4436152_1280.jpg'),
];

const DUMMY_WALLPAPERS = const [
  WallPaper(
    id: 'w1',
    title: 'Bill Cypher',
    category: 'Cartoon',
    wallPaperUrl: 'https://i.pinimg.com/originals/58/a5/ab/58a5aba24f2898940d9631ef366fa911.jpg',
    tags: ['Bill Cipher', 'Gravity falls'],
  ),
  WallPaper(
    id: 'w2',
    title: 'Wide cat',
    category: 'Animals',
    wallPaperUrl: 'https://cdn.pixabay.com/photo/2019/08/28/09/04/cat-4436152_1280.jpg',
    tags: ['Cats', 'Cat', 'Animal', 'Cute'],
  ),
  WallPaper(
    id: 'w3',
    title: 'Earth Sunrise',
    category: 'Space',
    wallPaperUrl: 'https://cdn.pixabay.com/photo/2016/10/20/18/35/sunrise-1756274_1280.jpg',
    tags: ['Earth', 'Outer Space', 'Sunrise', 'Globe'],
  ),
  WallPaper(
    id: 'w4',
    title: 'tickell\'s blue flycatcher',
    category: 'Animals',
    wallPaperUrl: 'https://cdn.pixabay.com/photo/2019/03/12/18/00/kerala-4051412_1280.jpg',
    tags: ['Bird', 'Blue', 'Animal', 'Pretty'],
  ),
  WallPaper(
    id: 'w5',
    title: 'Sky Baloon',
    category: 'Minimal',
    wallPaperUrl: 'https://cdn.pixabay.com/photo/2015/06/27/16/38/sky-823624_1280.jpg',
    tags: ['Sky', 'Baloon', 'Minimal', 'Freedom'],
  ),
  WallPaper(
    id: 'w6',
    title: 'Rain cloud',
    category: 'Minimal',
    wallPaperUrl: 'https://cdn.pixabay.com/photo/2017/02/14/16/19/blue-2066341_1280.png',
    tags: ['Blue', 'Cloud', 'Rain', 'Minimal', 'Weather'],
  ),
];
