/*import 'package:flutter_demo/main.dart';
import 'package:flutter_test/flutter_test.dart';

//import 'package:lib/main.dart';

void main() {
  testWidgets('Game waits for player input before advancing', (WidgetTester tester) async {
    await tester.pumpWidget(const SimpleDemoApp());
    await tester.pump();

    expect(find.text('Simple Demo'), findsOneWidget);
    //expect(find.textContaining('Score'), findsOneWidget);
    //expect(find.textContaining('Lives'), findsOneWidget);

    // Without any input, the game must stay paused indefinitely rather than
    // silently playing itself out (this is what let it reach Game Over
    // before anyone had a chance to see or play it).
    await tester.pump(const Duration(seconds: 5));
    expect(find.text('Simple Demo'), findsOneWidget);
    //expect(find.text('Score: 0'), findsOneWidget);

    await tester.tap(find.text('Simple Demo').last);
      await tester.pump();
  }
  
  
  );

}*/