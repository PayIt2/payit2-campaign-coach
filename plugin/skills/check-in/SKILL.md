---
name: check-in
description: Run a weekly health check on any campaign - diagnose issues and get a prioritized action plan
allowed-tools: Read, Write, WebSearch
argument-hint: "[optional: campaign name or current stats]"
---

Run a campaign health check: $ARGUMENTS

Follow this diagnostic workflow:

1. **Gather Context**: Use the campaign-context skill to establish:
   - Campaign type, title, URL (if available)
   - Current numbers - ask by type:
     - **Fundraiser**: Amount raised, donor count, days active, goal, channels being used
     - **Event**: Tickets sold, total capacity, days until event, channels being used
     - **Collection**: Payments received, people paid vs. total group, days until deadline, channels used

2. **Calculate Health Score**: Using the campaign-analytics skill, score 0-100 with type-specific weights:
   - Fundraiser: momentum 25%, social reach 20%, story quality 15%, donor engagement 15%, goal progress 15%, network activation 10%
   - Event: registration velocity 25%, capacity utilization 20%, promotion reach 20%, engagement 15%, revenue 10%, logistics 10%
   - Collection: payment rate 30%, deadline proximity 20%, communication cadence 20%, response rate 15%, transparency 15%

   Present the score with a factor-by-factor breakdown. If score is below 60, dispatch the campaign-assistant agent for deep analysis.

3. **Diagnose the Bottleneck**: Run the 3-stage diagnostic:
   - Stage 1: Is it a traffic problem? (Are people seeing the campaign?)
   - Stage 2: Is it a conversion problem? (Are visitors taking action?)
   - Stage 3: Is it an engagement problem? (Are supporters becoming advocates?)
   Name the primary bottleneck clearly.

4. **This Week's Action Plan**: Prescribe 3-5 actions in priority order:
   - Do today (highest impact, lowest effort)
   - Do this week (medium effort, strong impact)
   - Plan for next week (strategic, longer-term)

5. **Generate Fresh Content**: If the bottleneck is traffic or engagement, dispatch the content-generator agent to produce:
   - 3-5 social posts for the coming week
   - 1 campaign update to post on the page
   - 1 email or message template

6. **Save the Weekly Report**: Write the health check results to `[campaign-title]-checkin-[date].md` in the workspace.
