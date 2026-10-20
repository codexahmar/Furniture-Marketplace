You are an expert Flutter developer and UI/UX designer. Your task is to implement 3 pixel-perfect mobile screens for a "Furniture Marketplace App" matching the exact visual aesthetics, colors, typography, layout, shadows, and assets.

### Requirements:
1. **Single File Structure**: Write the complete code inside a single clean file `lib/main.dart` with well-modularized reusable widgets.
2. **Design Fidelity**:
   - Palette: Forest Green (`#233424`), Pure Black (`#121212`), Off-White background (`#E8E9EB`), Pure White (`#FFFFFF`), Muted Gray (`#7E7E7E`).
   - Fonts: Use Google Fonts ('Plus Jakarta Sans' or 'Inter').
   - Icons: Use `lucide_icons` or `flutter_tabler_icons` or standard `Icons` with exact visual styling.
3. **Asset Handling**: 
   - Fetch quality transparent 3D rendering armchair images directly from Unsplash / reliable online URLs (e.g. high quality PNG furniture URLs) so the app renders real visual imagery immediately without missing local asset errors. Include fallback network image error builders.
4. **Interactive Navigation**:
   - Create a page view or tab controller linking the 3 screens seamlessly (Catalog Screen -> Hero Promo Screen -> Product Detail Screen).

### Screen Details:

1. **Catalog Screen**:
   - Header with bold "Catalog" text and circular bell icon with red badge.
   - Search bar with filter icon.
   - Category horizontal filter list ("Lounge" active in black, "Office", "Dining", "Rocking").
   - 2-Column Staggered/Grid Product List containing chair cards with discount percentage tags (`-5%`, `-10%`), clear chair images, names ("Orris", "Elvo", "Mollis", "Kivi"), prices (`$320`, `$500`), and dark circular favorite buttons.
   - Floating dark bottom navigation bar with icons.

2. **Promotional Hero Screen**:
   - Full dark green background (`#233424`).
   - Top translucent circular back and notification icons.
   - Banner text: "Exclusive" tag with icon, large white bold title: "Make Space For Something Better".
   - Central white curved card showcasing the "Orris Chair" ($320) with discount tag (`-5%`) and dark floating shopping bag button.
   - Bottom full-width white button "Shop More".

3. **Product Detail Screen**:
   - Top translucent circular back arrow and black circular favorite heart button.
   - Color picker dot indicators at top (Green selected with ring, Orange, Coral Red).
   - Large central Green Velvet Lounge Chair image placed on a stylized circular shadow pedestal.
   - Horizontal slide indicator handle beneath chair.
   - Bottom sheet white card overlaying the background:
     - Title: "Sienna Lounge Chair"
     - Description: "A sculptural, ergonomic lounge chair designed for modern relaxation spaces."
     - Price: "$550" with dark discount tag "-5%".
     - Quantity counter widget ("-", "1", "+").
     - Bottom full-width black CTA button: "Buy for $550".

Make sure code uses `ThemeData`, modern Flutter practices, proper null safety, `Const` constructors, and smooth spacing using `SizedBox` and `Padding`.

