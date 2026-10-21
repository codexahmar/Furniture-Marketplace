import 'package:flutter_test/flutter_test.dart';
import 'package:furniture_marketplace/main.dart';

void main() {
  testWidgets('Furniture Marketplace smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const FurnitureMarketplaceApp());
    await tester.pumpAndSettle();

    // Verify Catalog screen elements render
    expect(find.text('Catalog'), findsWidgets);
    expect(find.text('Lounge'), findsWidgets);
    expect(find.text('Office'), findsWidgets);
  });
}
