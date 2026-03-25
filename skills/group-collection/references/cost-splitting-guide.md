# Cost Splitting Guide

Practical tools for calculating, communicating, and managing group payment splits on PayIt2.

---

## Fixed Split Calculator

The simplest model: divide the total evenly among all participants.

**Formula**: Total cost ÷ number of people = per-person amount (round up to nearest dollar)

### Common Scenarios

| Scenario | Total Cost | Group Size | Per Person (exact) | Per Person (rounded up) |
|----------|-----------|-----------|-------------------|------------------------|
| Team jerseys | $450 | 15 | $30.00 | $30.00 |
| Weekend cabin | $1,200 | 8 | $150.00 | $150.00 |
| Group dinner | $340 | 12 | $28.33 | $29.00 |
| Conference tickets | $2,500 | 20 | $125.00 | $125.00 |
| Club annual dues | $3,600 | 30 | $120.00 | $120.00 |
| Neighborhood fence | $8,000 | 6 | $1,333.33 | $1,334.00 |

### Why Round Up

Rounding up by a few cents or a dollar per person creates a small buffer that absorbs:
- Transaction processing fees
- Rounding discrepancies across multiple payments
- Minor cost overruns

Example: $340 dinner with 12 people. Exact split is $28.33. Collecting $29 each yields $348, providing an $8 buffer. Communicate this: "We're collecting $29 per person to cover the bill plus a small buffer for tax and tip adjustments."

### Large Group Calculations

| Total Cost | 10 people | 15 people | 20 people | 25 people | 30 people | 50 people |
|-----------|----------|----------|----------|----------|----------|----------|
| $500 | $50 | $34 | $25 | $20 | $17 | $10 |
| $1,000 | $100 | $67 | $50 | $40 | $34 | $20 |
| $2,500 | $250 | $167 | $125 | $100 | $84 | $50 |
| $5,000 | $500 | $334 | $250 | $200 | $167 | $100 |
| $10,000 | $1,000 | $667 | $500 | $400 | $334 | $200 |

All amounts rounded up to the nearest dollar.

---

## Tiered Split Examples

When participants have different options, set up multiple tiers on the collection page.

### Example 1: Weekend Trip with Room Options

**Total trip cost**: $4,200 (cabin rental + food + activities)

| Tier | Description | Cost | Expected Count | Subtotal |
|------|------------|------|---------------|----------|
| A | Private room | $280 | 6 | $1,680 |
| B | Shared room (2 per room) | $200 | 8 | $1,600 |
| C | Day visit only | $100 | 4 | $400 |
| | Buffer for incidentals | | | $520 |
| | **Total** | | **18 people** | **$4,200** |

**How to set up**: Create the collection with a $4,200 goal. In the description, list the three options with prices. Ask people to select their tier when paying.

### Example 2: Event with Meal Options

**Total event cost**: $2,400

| Tier | Description | Cost |
|------|------------|------|
| A | Full event + dinner | $85 |
| B | Full event + vegetarian dinner | $85 |
| C | Event only (no meal) | $50 |

**Tip**: Even if meal options cost you the same, grouping them helps with headcount planning.

### Example 3: Equipment with Size Variations

**Team uniform order**: Base cost is the same, but some items have upcharges.

| Item | Standard Sizes (S-XL) | Extended Sizes (2XL-4XL) |
|------|----------------------|-------------------------|
| Jersey | $45 | $52 |
| Shorts | $25 | $30 |
| Socks | $12 | $12 |
| **Total** | **$82** | **$94** |

**How to handle**: Set the standard price as the default. Note the upcharge in the description and ask those who need extended sizes to add the difference.

---

## Handling Partial Payments

Some group members may not be able to pay the full amount at once. Here are approaches:

### Installment-Friendly Collections

For larger per-person amounts ($100+), consider these options:

1. **Two-payment structure**: Collect a deposit (50%) now and the balance by a later date. Set up two collection pages or one with a note about the two-phase approach.
2. **Allow partial payments**: In the collection description, note: "If you need to split this into two payments, you're welcome to pay half now and half by [date]." PayIt2 tracks partial contributions per person.
3. **Early bird deadline**: "Pay in full by [early date] to lock in your spot. Payment plans available — DM me."

### Tracking Partial Payments

- PayIt2 shows each contributor's total even if paid across multiple transactions
- Keep a simple spreadsheet alongside the collection if tracking installments manually
- Send a private message confirming receipt of partial payments: "Got your first payment of $[amount]. Balance of $[remaining] due by [date]."

---

## Fee Transparency

PayIt2 charges transaction fees on payments. As an organizer, you have two options for handling fees:

### Option A: Absorb the Fees

You (the organizer) cover the fees by slightly increasing the collection target.

**Example**: You need $1,000. With a 2.9% + $0.30 fee per transaction:

| Per-Person Amount | Fee per Transaction | Net per Transaction | Needed from 20 people |
|------------------|--------------------|--------------------|----------------------|
| $50.00 | $1.75 | $48.25 | Collect $52 each → $1,040 total |
| $100.00 | $3.20 | $96.80 | Collect $104 each → $2,080 total |
| $25.00 | $1.03 | $23.97 | Collect $26 each → $520 total |

**How to communicate**: "I've rounded up slightly to cover processing fees so we hit our target cleanly."

### Option B: Pass Fees Through

Contributors pay the fee on top of their share. PayIt2 can add this automatically at checkout.

**Example**: $50 payment with fees passed through:
- Contributor pays: $51.75 ($50.00 + $1.75 fee)
- Organizer receives: $50.00

**How to communicate**: "The payment page will add a small processing fee at checkout. This ensures 100% of your contribution goes to [purpose]."

### Which to Choose

| Factor | Absorb Fees | Pass Through Fees |
|--------|------------|------------------|
| Contributor experience | Cleaner — one round number | Slightly higher total shown at checkout |
| Organizer math | Need to calculate buffer | Simpler — collect exact target |
| Best for | Small groups, low amounts | Larger groups, higher amounts |
| Perception | "Organizer covered it" | "Standard processing fee" |

**General rule**: For collections under $50/person, absorb the fees. For collections over $50/person, passing through is standard and expected.

---

## Overages and Refunds

### What If You Collect More Than Needed?

This happens when you round up per-person amounts or receive unexpected extra contributions.

**Options for handling overages**:

1. **Roll forward**: Apply the overage to the next group expense. "The extra $45 will go toward our next team dinner." Best for recurring groups.
2. **Reduce future collection**: Lower the next collection amount by the overage. "Since we had $45 left over last time, this month's dues are $[reduced amount]."
3. **Refund proportionally**: Divide the overage equally and return it. Only practical for significant overages ($5+ per person).
4. **Group decision**: Ask the group. "We have $45 left over. Should we roll it forward, split a refund, or donate it to [cause]?"

**Best practice**: Communicate overage handling *before* collecting. Include a line in your description: "Any overage will be [applied to the next collection / refunded proportionally]."

### What If You Don't Collect Enough?

1. **Extend the deadline**: Give an extra 3-5 days with a final reminder.
2. **Cover the gap**: If it's small, the organizer covers the difference.
3. **Adjust the plan**: Downgrade options to match the collected amount (smaller venue, fewer items, etc.).
4. **Communicate transparently**: "We collected $[amount] of our $[goal] target. Here's what we're adjusting..."

---

## Late Payment Handling

### Grace Period Best Practices

- **Standard grace period**: 2-3 days after the stated deadline
- **Communication**: Send one private message on the deadline or the day after
- **Tone**: Understanding, not accusatory. "I know things get busy" goes a long way.
- **Final cutoff**: Set a hard close date and communicate it. "I need to finalize by [date], so that's the absolute last day."

### When to Close the Collection

Close the collection page when:

1. **Goal is reached** and all expected contributors have paid
2. **Grace period has passed** and you've followed up privately with non-payers
3. **You need to spend the funds** — close the page before making purchases so the final amount is locked

### Handling Non-Payers

Some people will not pay despite reminders. Handle with grace:

1. **First**: Private message with the link and a friendly tone
2. **Second**: If no response after 2-3 days, ask directly: "Are you still planning to pay for [purpose]? No worries if your plans changed — just let me know so I can adjust the numbers."
3. **If they can't pay**: Adjust the per-person cost for remaining members (if the total is fixed) or reduce the collection goal
4. **Never**: Publicly shame, send aggressive messages, or exclude someone from a group over a late payment

**Remember**: Preserving the relationship is more important than collecting every dollar. A respectful approach means people will participate willingly next time.
