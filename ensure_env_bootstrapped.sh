#!/usr/bin/env sh

################################################################################
# Helpers
################################################################################

function error() {
  local -r msg="${1}"

  echo "ERROR: ${msg}"
}

function info() {
  local -r msg="${1}"

  echo "> ${msg}"
}

function die() {
  error "Exiting..."
  exit 1
}

function die_with_message() {
  local -r msg="${1}"

  error "${msg}"
  die
}

function is_installed() {
  local cmd="${1}"

  command -v "${cmd}" >/dev/null 2>&1
}

function ensure_installed() {
  local cmd="${1}"

  if ! is_installed "${cmd}"; then
    die_with_message "'${cmd}' is not installed, but is required"
  fi
}

function ensure_correct_ruby() {
  local -r target_ruby_version=$( cat .ruby-version )
  local -r actual_ruby_version=$( ruby -e "puts RUBY_VERSION" )

  if [ "${target_ruby_version}" != "${actual_ruby_version}" ]; then
    die_with_message "Your version of ruby [${actual_ruby_version}] is different than the required version [${target_ruby_version}]"
  fi
}

function ensure_bundle_install() {
  if ! bundle check >/dev/null; then
    if bundle install; then
      echo
    else
      echo '--------------------------------------------------------------------------------'
      error 'Bundle install failed'
      error 'Please reach out for help on odevs slack so we can update this script'
      die
    fi
  fi
}

function print_success_msg() {
  info 'Looks like your environment is setup correctly!'
  info
  info 'You should now be able to begin work with:'
  info '    bundle exec jekyll serve'
}

################################################################################
# DO WORK SON
################################################################################

function main() {
  ensure_installed ruby
  ensure_correct_ruby

  ensure_installed bundle
  ensure_bundle_install

  print_success_msg
}

main

