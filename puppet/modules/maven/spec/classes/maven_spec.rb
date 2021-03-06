require 'spec_helper'

describe 'maven::maven' do
  let(:title) { 'maven' }

  context "when downloading maven" do
    it do should contain_wget__fetch('fetch-maven').with(
        'source'      => 'http://archive.apache.org/dist/maven/binaries/apache-maven-3.0.5-bin.tar.gz',
        'user'        => nil,
        'password'    => nil
    ) end
  end

  context "when downloading maven from another repo" do
    let(:params) { { :repo => {
        'url'      => 'http://repo1.maven.org/maven2',
        'username' => 'u',
        'password' => 'p'
      }
    } }

    it 'should fetch maven with username and password' do
      should contain_wget__authfetch('fetch-maven').with(
        'source'      => 'http://repo1.maven.org/maven2/org/apache/maven/apache-maven/3.0.5/apache-maven-3.0.5-bin.tar.gz',
        'user'        => 'u',
        'password'    => 'p')
    end
  end
end
