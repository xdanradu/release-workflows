
# Context
    - Github is used (ex: actions)
    - As a product owner I want clarity over what exactly is in a build, next to the the planned work from sprint. By having a clear overview of technical contents of a package we can prevent regression issues from happening or at least reaching production system.
    - A release will give a better report on the changes since the last release, especially if we take care to create release branches for every (hotfix) deployment.
    - The release notes that are generated for a release contain detailed logs of commits/changes that have been made. These should become part of the regular deployment communications so that we have more clarity on what we release.

# Requirements
    - For a normal release: release/b2c-commerce-2025-32
    - For a hotfix release auto increment is needed: release/b2c-commerce-2025-32-hotfix-1, release/b2c-commerce-2025-32-hotfix-2 (etc)

    - In any deployment related communication where we now already share our release notes, we should also share the release report from github, especially between developer teams
   Github actions:
    - When a new release branch is created, a new release is also created. Its tag is set to the head of the new release branch. This release can have a prerelease status (so not final/immutable)
    - Provide deployment workflows to two environments s1 (staging) and p1 (production)
    - On every deployment to s1, the release tag is moved again to the head of the release. 
    - Once the build is deployed to p1, the release should become final and immutable.
    - Provide all the required workflows (including a simulated (only logging) deployment to s1 and p1), as simple as possible, for the current repository
    - Instead of main we use develop branch to create releases from which is already created in the repository
