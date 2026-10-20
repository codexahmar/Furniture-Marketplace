Design System & UI Specification: Furniture Marketplace App

This document provides a pixel-precise specification for implementing the 3 mobile screens (Catalog Screen, Promotional / Hero Screen, and Product Detail Screen) in Flutter.

1. Color Palette

Primary & Accent Colors

Dark Olive / Forest Green Primary (#2B3E2C / #233424): Used for background cards, full screen hero background, primary badges, floating action button background on Detail Screen, and dark accent pills.

Pure Black (#000000 / #121212): Used for main CTA buttons (e.g., "Buy for $550", Active Category Filter "Lounge", Floating circular action buttons like favorite/cart).

Light Neutral Gray Background (#EAEBED / #E8E9EB): Main app background color across the app screens.

Card & Surface White (#FFFFFF): Product card backgrounds, rounded bottom sheets, and pill containers.

Muted Text Gray (#8E8E93 / #6C6C70): Secondary labels, descriptions, and inactive states.

Discount Tag Dark Gray / Black (#1C1C1E): Small discount pill background (-5%, -10%).

Product Color Indicator Palette (Detail Screen)

Green (Active): #517C4F

Orange: #E58A43

Coral/Red: #E56756

2. Typography & Fonts

Recommended Primary Font Family: Plus Jakarta Sans, Inter, or SF Pro Display (Clean modern sans-serif with geometric roundness).

Text Styles Definition

App Title / Large Screen Title:

Size: 28pt - 32pt

Weight: Bold (FontWeight.w700)

Color: #000000 or #FFFFFF (depending on screen theme)

Banner Hero Title ("Make Space For Something Better"):

Size: 30pt - 34pt

Weight: Bold (FontWeight.w700)

Height/Line Spacing: 1.1

Color: #FFFFFF

Section Headers / Product Title (Detail):

Size: 20pt - 22pt

Weight: SemiBold (FontWeight.w600) / Bold

Product Name (Card):

Size: 14pt - 15pt

Weight: Medium (FontWeight.w500) / SemiBold

Price Text:

Size: 16pt - 18pt (Bold on Detail Screen)

Weight: Bold (FontWeight.w700)

Category Pill Label:

Size: 13pt - 14pt

Weight: Medium (FontWeight.w500)

Description Body Text:

Size: 12pt - 13pt

Color: #7E7E7E

Height: 1.4

3. Component Specifications

A. Catalog Screen (Screen 1)

Header:

Left: "Catalog" Title (Bold, ~28pt).

Right: Notification Bell button (Circular Light Gray background, dark icon with red/black indicator dot).

Search Bar:

White rounded container (BorderRadius.circular(30)).

Left: Search Icon.

Text: Placeholder "Search".

Right: Filter/Adjustment sliders icon.

Category Selector (Horizontal Scroll):

Active item ("Lounge"): Solid Black background, White text, rounded pill shape.

Inactive items ("Office", "Dining", "Rocking"): Transparent/White background, Gray border or light gray container, dark text.

Product Grid (2 Columns):

Each card has:

Card Container: Light Gray/White surface with BorderRadius.circular(24).

Discount Badge (Top Right): Pill shape, Dark Gray background, White bold text (e.g., -5%, -10%).

Transparent PNG Product Image (Chairs: Green velvet, Orange armchair, Brown leather wingback, Green grid accent chair).

Product Title below image.

Price below title.

Favorite Floating Button (Bottom Center): Circular white/black button with Heart icon.

Floating Bottom Navigation Bar:

Dark Pill container containing:

Cart icon with badge (0), Bag icon, Home, Search, Settings icon.

B. Promotional Hero Screen (Screen 2)

Background: Full screen dark green palette (#233424).

Header: Top left Back arrow button (circular translucent/dark gray), Top right Notification bell with badge.

Hero Title:

Center-aligned top text: "Exclusive" with small crown/sofa icon.

Large headline: "Make Space For Something Better" (White, Bold, tight line-height).

Hero Feature Card:

Central white container with top-rounded corners (BorderRadius.circular(30)).

Holds high-resolution Green Velvet "Orris Chair" image.

Discount tag (-5%) on top right of the chair.

Title ("Orris Chair") and Price ("$320").

Circular dark cart button at the bottom center.

Bottom Action Button:

Full-width White rounded button ("Shop More") with bold dark text.

C. Product Detail Screen (Screen 3)

Header:

Left: Circular Back Arrow button.

Right: Circular Favorite Heart button (Black background, White heart).

Color Palette Selector:

Horizontal row of color dots at top of product image: Green (selected, encircled), Orange, Red.

Product Showcase:

High-res chair image on a circular shadow/pedestal platform graphic.

Interactive slider horizontal adjustment icon indicator below chair.

Details Bottom Card:

White rounded card container sliding up from bottom.

Floating Bag Icon attached to the top-right edge.

Title: "Sienna Lounge Chair".

Subtitle / Description text in muted gray.

Price & Discount section ($550, -5%).

Quantity Selector (- 1 +) on light gray rounded container.

Main CTA: Full-width Black rounded button ("Buy for $550").

4. Reusable Flutter Widget Architecture

lib/
├── core/
│   ├── constants/
│   │   ├── app_colors.dart
│   │   └── app_typography.dart
│   └── theme/
│       └── app_theme.dart
├── data/
│   └── mock_products.dart
└── presentation/
    ├── widgets/
    │   ├── custom_button.dart
    │   ├── category_pill.dart
    │   ├── product_card.dart
    │   └── custom_nav_bar.dart
    └── screens/
        ├── catalog_screen.dart
        ├── hero_promo_screen.dart
        └── product_detail_screen.dart
