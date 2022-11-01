# frozen_string_literal: true

class EnvironmentManager
  def initialize(fastlane:, is_github_actions:)
    @fastlane = fastlane
    @is_github_actions = is_github_actions
  end

  def save_build_context_to_ci()
    ipa_path =  Fastlane::Actions.lane_context[Fastlane::Actions::SharedValues::IPA_OUTPUT_PATH]
    dsym_path = Fastlane::Actions.lane_context[Fastlane::Actions::SharedValues::DSYM_OUTPUT_PATH]
    build_number = Fastlane::Actions.lane_context[Fastlane::Actions::SharedValues::BUILD_NUMBER]

    if @is_github_actions
      @fastlane.sh("echo IPA_OUTPUT_PATH=#{ipa_path} >> $GITHUB_ENV")
      @fastlane.sh("echo DSYM_OUTPUT_PATH=#{dsym_path} >> $GITHUB_ENV")
      @fastlane.sh("echo BUILD_NUMBER=#{build_number} >> $GITHUB_ENV")
    end
  end
end
  