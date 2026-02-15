# Upfront Marketing Site

This is the website for [Upfront](https://allupfront.com). To request changes to the site, follow the instructions below.

## How to Request a Site Edit

1. **Create a new issue** at [github.com/dgrtwo/all-upfront/issues/new](https://github.com/dgrtwo/all-upfront/issues/new/choose)

2. **Select "Site Edit"** and describe what you'd like changed in plain language. For example:
   - "Change the headline on the homepage to 'Better Data for Better Childcare'"
   - "Update the phone number in the footer to 555-123-4567"
   - "Add a new testimonial from Jane Smith, Director of XYZ Organization"

3. **Wait a few minutes.** An AI assistant will read your request, make the changes, and open a pull request (PR) linking back to your issue.

4. **Review the preview.** Cloudflare will automatically post a comment on the PR with a link to a staging version of the site. Click it to see exactly how your changes will look.

5. **Approve or request changes.** Comment on the PR:
   - To approve: "Looks good", "Ship it", "Approved", etc.
   - To request changes: Describe what needs to be different

6. **Changes go live.** Once approved, changes will be merged and live on allupfront.com within a few minutes.

## Troubleshooting

If a PR doesn't appear within 5 minutes of creating your issue:

1. Check [github.com/dgrtwo/all-upfront/actions](https://github.com/dgrtwo/all-upfront/actions) to see if the workflow is running or failed
2. If it failed, check the error message and try creating a new issue with more details
3. You can also comment `@claude` on your issue to trigger a retry

## For Developers

See [CLAUDE.md](CLAUDE.md) for technical details about the codebase structure and development workflow.
