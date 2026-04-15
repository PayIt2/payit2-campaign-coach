---
name: promote
description: Build a multi-channel promotion strategy and content calendar for any campaign type
allowed-tools: Read, Write, WebSearch
argument-hint: "[optional: campaign name, URL, or type]"
---

Build a promotion strategy for this campaign: $ARGUMENTS

Follow this workflow:

1. **Gather Context**: Use the campaign-context skill to establish campaign type, title, URL (if live), how long it's been running, and what promotion has been tried so far.

2. **Assess Current State**: Ask:
   - "Which channels have you been using?"
   - "What's working and what isn't?"
   - "Any specific platforms or audiences you want to target?"

3. **Recommend Channel Strategy**: Using the campaign-promotion skill, prioritize channels based on type and what the organizer has told you:
   - Fundraisers: Lead with personal networks (Facebook, email, text)
   - Events: Lead with social discovery (Instagram, TikTok, community boards, partner cross-promotion)
   - Collections: Lead with direct messaging (group text, Slack/Teams, email)

   Present the prioritized channel list and explain why each is (or isn't) a priority for their specific situation.

4. **Build the Content Calendar**: Create a phased schedule appropriate to the campaign type:
   - Fundraiser: 4 phases over 30 days
   - Event: 6 phases over 4-6 weeks
   - Collection: 5 phases over 2-3 weeks

   Include specific posting days, content angles for each post, and which channels to use.

5. **Generate Batch Content**: Dispatch the content-generator agent to produce:
   - 5-7 social media posts (platform-native, varied angles)
   - 2-3 email templates (appropriate to their tier/phase)
   - 2-3 text message templates (for inner circle or group)
   - SEO recommendations (keywords to use, community groups to post in, media outreach angles if relevant)

6. **Save the Promotion Package**: Write all content to `[campaign-title]-promotion-[date].md` in the workspace, organized by platform and phase.
