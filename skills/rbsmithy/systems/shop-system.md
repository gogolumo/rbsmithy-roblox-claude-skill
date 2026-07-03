# Shop system blueprint

## Purpose
Sell server-approved items while protecting economy integrity.

## Server responsibilities
- Own product catalog.
- Validate currency balance.
- Apply purchase.
- Save result.
- Log economy sink.

## Client responsibilities
- Display catalog.
- Request purchase by product id.
- Show result state.

## Abuse checks
- Client cannot send price.
- Client cannot send reward amount.
- Product id must exist in server catalog.
- Purchase cooldown/rate limit required.
