# Save reference to stub analytics
stub = window.analytics ? []

# Create new analytics instance to replace stub
window.analytics = analytics = new (require './analytics')

analytics.debug() if stub.debug

# Initialize analytics instance
analytics.initialize {}

# Loop through stub calls and replay them
while stub.length > 0
  item = stub.shift()
  method = item.shift()
  if analytics[method]?
    analytics[method].apply analytics, item

# track this page
analytics.page()
