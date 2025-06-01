# Project: improve_typography

## Overview
improve_typography is a Ruby gem that improves typography (quotes, hyphens, etc.) of text strings by applying locale-specific transformations. It intelligently processes text while preserving HTML structure and supports multiple languages with customizable processors.

## Key Components

### Core Architecture
- **Base Class** (`lib/improve_typography/base.rb`): Main entry point that orchestrates text processing through multiple processors
- **Processor** (`lib/improve_typography/processor.rb`): Abstract base class for all typography processors
- **Configuration** (`lib/improve_typography/configuration.rb`): Manages default processor list and ordering

### Processors
Located in `lib/improve_typography/processors/`:
- **Apostrophe**: Converts straight apostrophes to curly ones (e.g., `isn't` → `isn't`)
- **DoubleQuotes**: Converts straight double quotes to locale-specific curly quotes
- **SingleQuotes**: Converts straight single quotes to locale-specific curly quotes
- **Ellipsis**: Converts multiple dots to proper ellipsis character (e.g., `...` → `…`)
- **EmDash**: Converts spaced hyphens to em dashes (e.g., `word - word` → `word—word`)
- **EnDash**: Converts spaced hyphens to en dashes for ranges (e.g., `June 15 - June 20`)
- **MultiplySign**: Converts 'x' to multiplication sign in numeric contexts (e.g., `2x10` → `2 × 10`)
- **Nbsp**: Adds non-breaking spaces in appropriate places
- **Numbers**: Placeholder for number-related transformations
- **Units**: Adds superscript to unit measurements (e.g., `50 m2` → `50 m²`)
- **WordLineSeparator**: Converts Unicode line separator characters to newlines

### Locale Support
- Locale files in `lib/config/locales/` define replacement characters
- Currently supports English (`:en`) and Czech (`:cs`)
- Danish (`:da`) file exists but is incomplete
- Custom locale-specific processor classes can override default behavior

## Important Implementation Details

### HTML Safety
- Uses Nokogiri to parse HTML and only processes text nodes
- Preserves HTML attributes and structure
- Properly unescapes HTML entities after processing

### Processor Ordering
Default processor order (defined in Configuration):
1. WordLineSeparator
2. Ellipsis
3. EnDash
4. EmDash
5. MultiplySign
6. Nbsp
7. Numbers
8. SingleQuotes
9. DoubleQuotes
10. Apostrophe
11. Units

Order matters because some processors may conflict or depend on others.

### Locale Inheritance
- Processors automatically look for locale-specific implementations
- Falls back to base processor if no locale-specific version exists
- Locale-specific processors follow naming pattern: `ImproveTypography::Processors::{LOCALE}::{ProcessorName}`

### Regular Expression Patterns
Key patterns used:
- Apostrophe: `/(\w+)'(\w*)/i`
- Ellipsis: `/(\.\s*?){3,}/i`
- MultiplySign: `/(\d+|[½⅓¼⅔⅛⅜⅝⅞])(\s*)x(\s*)(\d+|[½⅓¼⅔⅛⅜⅝⅞])/i`
- Units: `/(\d\s*)(m|mm|cm|km)(2|3)/`

## Testing Structure
- Unit tests for each processor in `test/improve_typography/processors/`
- Integration tests in `test/improve_typography/base_test.rb`
- Benchmark test for performance monitoring
- Uses Minitest framework

## Configuration Options
- Global configuration via `ImproveTypography.configure` block
- Per-call options can override locale and processors
- Custom signs can be passed as options to individual processors

## Version History
Current version: 0.1.17
- Recent fixes include single quote apostrophe handling and missing i18n translation guards

## Development Workflow
1. Run tests: `bundle exec rake test`
2. Console: `bin/console` for interactive testing
3. Uses Travis CI for continuous integration
4. Uses Guard for auto-running tests during development

## Key Dependencies
- `i18n`: For internationalization support
- `nokogiri`: For safe HTML parsing
- Development: minitest, guard, rake

## Common Issues and Solutions
1. **Apostrophes in contractions**: Fixed in v0.1.17 to avoid capturing as quotes
2. **Missing translations**: Processors check for translation existence before processing
3. **HTML entity escaping**: Handled by CGI.unescapeHTML after processing

## Future Considerations
- Add more locale support (Danish file exists but needs completion)
- Expand Numbers processor functionality
- Consider performance optimizations for large texts
- Add more unit types to Units processor
