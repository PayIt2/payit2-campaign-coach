---
name: campaign-analytics
description: >
  This skill should be used when the user asks to "check my campaign health", "how is my campaign
  doing", "analyze my fundraiser performance", "why aren't I getting donations", "optimize my
  campaign", "what should I do next", "campaign is stalled", or needs data-driven recommendations
  to improve fundraising results. Also triggers on "campaign metrics", "conversion rate",
  "fundraiser analytics", "performance score", "campaign diagnosis", or "fundraiser optimization".
version: 0.1.0
---

# Campaign Analytics

Diagnose campaign health, identify bottlenecks, and prescribe specific actions to improve fundraising performance. This skill turns raw campaign data into actionable coaching.

## Campaign Health Score

Calculate a health score (0-100) based on these weighted factors:

| Factor | Weight | Scoring criteria |
|--------|--------|-----------------|
| Momentum | 25% | Donation velocity vs. category average |
| Social reach | 20% | Shares, unique visitors, share-to-visit ratio |
| Story quality | 15% | Description length, photo present, video present, title strength |
| Donor engagement | 15% | Thank-you rate, update frequency, donor return rate |
| Goal progress | 15% | Percentage of goal reached vs. days active |
| Network activation | 10% | Co-organizer count, email list usage, channel diversity |

### Score Interpretation

| Score | Status | Action |
|-------|--------|--------|
| 80-100 | Thriving | Maintain cadence, expand to new channels |
| 60-79 | Healthy | Address 1-2 weak areas, increase promotion frequency |
| 40-59 | At risk | Significant changes needed — refresh content, new channels, re-engagement |
| 20-39 | Critical | Major intervention — rewrite story, new media, activate inner circle |
| 0-19 | Stalled | Consider relaunch with new strategy |

## Diagnostic Framework

When an organizer asks "why aren't I getting donations?" or "my campaign is stalled," run through this diagnostic:

### Stage 1: Traffic Diagnosis

**Question**: Are people seeing the campaign?

Check:
- Total page views in last 7 days
- Traffic sources (social, direct, email, search)
- Number of unique shares
- Channels being used

**If traffic is low**: The problem is promotion, not the page.
- Prescribe: Increase posting frequency, activate new channels, email blast, ask supporters to share
- Reference the `campaign-promotion` skill for detailed promotion strategies

### Stage 2: Conversion Diagnosis

**Question**: Are visitors donating?

Check:
- Visit-to-donation conversion rate (healthy = 5-15%)
- Average time on page
- Bounce rate
- Average donation amount

**If traffic is fine but conversion is low**: The problem is the page itself.
- Prescribe: Rewrite title, update story (shorter + more emotional), add/improve photo, add video
- Reference the `campaign-creation` skill for page optimization

### Stage 3: Engagement Diagnosis

**Question**: Are donors becoming advocates?

Check:
- Donor-to-sharer ratio (target: >15%)
- Repeat donation rate
- Update frequency (organizer posting updates?)
- Thank-you completion rate

**If conversion is fine but growth has stalled**: The problem is engagement loop.
- Prescribe: Thank donors, post updates, ask for shares, add co-organizers
- Reference the `donor-engagement` skill for engagement strategies

## Benchmarking

Compare campaign performance against category benchmarks:

### Category Benchmarks (based on GoFundMe aggregate data)

| Category | Avg. raised | Avg. donors | Avg. campaign length | Success rate |
|----------|------------|-------------|---------------------|-------------|
| Medical/Health | $5,000-$15,000 | 50-150 | 30-60 days | 22% |
| Legal Defense | $3,000-$10,000 | 30-100 | 30-45 days | ~20% |
| Emergency/Crisis | $2,000-$8,000 | 25-80 | 14-30 days | 28% |
| Education | $1,500-$5,000 | 20-60 | 30-60 days | 25% |
| Memorial/Funeral | $3,000-$10,000 | 40-120 | 14-21 days | 35% |
| Community/Nonprofit | $2,000-$10,000 | 30-100 | 30-90 days | 18% |

### Key Performance Indicators

Track and report on these KPIs weekly:

| KPI | Formula | Target |
|-----|---------|--------|
| Donation velocity | Donations per day | >2/day for first week |
| Share rate | Shares / page views | >5% |
| Conversion rate | Donations / unique visitors | 5-15% |
| Average donation | Total raised / donor count | $35-$75 |
| Donor-to-sharer ratio | Sharers / donors | >15% |
| Update frequency | Updates / weeks active | >1/week |
| Time to first donation | Hours from launch to first gift | <4 hours |

## Optimization Playbook

Based on the health score, prescribe from this action menu:

### Quick Wins (implement today)
1. Add or improve the primary photo (face visible, emotional)
2. Shorten the description to under 150 words
3. Add a co-organizer (3x success rate multiplier)
4. Thank all unthanked donors
5. Post one campaign update

### Medium Effort (implement this week)
1. Record and upload a personal video (4x more funds)
2. Send personalized emails to top 20 contacts
3. Create platform-native content for 3+ social channels
4. Post a milestone update or "story behind the story" content
5. Set up a content calendar for the next 2 weeks

### Strategic Moves (implement if campaign is stalled)
1. Rewrite the campaign title (test 3 options)
2. Refresh the entire description with new story angle
3. Pitch local media for coverage
4. Cross-post to community groups (Nextdoor, Reddit, Facebook Groups)
5. Launch a "final push" campaign with deadline urgency

## Reporting Templates

Generate weekly performance reports covering:

1. **Headline metrics**: Amount raised, donors, shares (with week-over-week change)
2. **Health score**: Current score with factor breakdown
3. **What's working**: Top-performing content and channels
4. **What needs attention**: Lowest-scoring factors with specific fixes
5. **This week's action items**: 3-5 prioritized tasks

## Event-Specific Analytics

When analyzing an **event** (not a fundraiser), track these additional KPIs:

### Event KPIs (Track Weekly)
| KPI | Healthy Range | Warning Sign |
|-----|--------------|--------------|
| Registration velocity | 10-15% of capacity per week | <5% per week after launch |
| Capacity utilization | On track to 80%+ by event date | <50% at midpoint |
| Early bird conversion | 25-35% of total tickets | <15% (pricing too high or promotion too weak) |
| Ticket tier distribution | Even spread across tiers | >80% in cheapest tier (value gap too large) |
| Share rate | 1 in 5 registrants shares | <1 in 10 (event not share-worthy) |
| Email open rate | 40-60% for event emails | <25% (subject lines or timing) |

### Event Health Score Adjustments
When scoring event health, replace donation-specific factors:
- **Momentum (25%)**: Registration velocity relative to capacity and time remaining
- **Social reach (20%)**: Shares, tags, partner promotion reach
- **Page quality (15%)**: Description clarity, visual appeal, tier structure
- **Registration conversion (15%)**: Visitors-to-registrants ratio (healthy: 15-25%)
- **Promotion breadth (15%)**: Number of channels actively used
- **Urgency signals (10%)**: Countdown messaging, scarcity indicators, price tier deadlines

## Additional Resources

- **`references/benchmark-data.md`** — Detailed category benchmarks and success factors
- **`references/optimization-checklist.md`** — Comprehensive checklist for campaign optimization
