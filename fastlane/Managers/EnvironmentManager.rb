# frozen_string_literal: true

class EnvironmentManager
  def initialize(fastlane:, is_github_actions:, is_bitrise:, build_path:)
    @fastlane = fastlane
    @is_github_actions = is_github_actions
    @is_bitrise = is_bitrise
    @build_path = build_path
  end

  def save_build_context_to_ci(version_number:)
    build_number = Fastlane::Actions.lane_context[Fastlane::Actions::SharedValues::BUILD_NUMBER]

    if @is_github_actions
      @fastlane.sh("echo BUILD_NUMBER=#{build_number} >> $GITHUB_ENV")
      @fastlane.sh("echo VERSION_NUMBER=#{version_number} >> $GITHUB_ENV")
      @fastlane.sh("echo BUILD_PATH=#{@build_path} >> $GITHUB_ENV")
    end
    if @is_bitrise
      @fastlane.sh("envman add --key BUILD_PATH --value '#{@build_path}'")
    end
  end
end
