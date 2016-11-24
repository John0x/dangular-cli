import 'package:grinder/grinder.dart';

main(args) => grind(args);

@DefaultTask()
@Depends(test)
build() {
  Pub.build();
}

@Task()
test() => new TestRunner().testAsync();

@Task()
clean() => defaultClean();
