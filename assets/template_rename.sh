#!/bin/bash
echo "Please enter desired project name: "
read project_name

if [ -n "${project_name}" ]; then
  find . ! -path . -type d -name "SwiftTemplate*" -print0 | xargs -0 rename -S "SwiftTemplate" "$project_name"
  find . ! -path . -type f -name "SwiftTemplate*" -print0 | xargs -0 rename -S "SwiftTemplate" "$project_name"
  ack --literal --files-with-matches "SwiftTemplate" --print0 | xargs -0 sed -i "" "s/SwiftTemplate/$project_name/g"
else
  echo "No project name entered.  No changes completed."
fi
