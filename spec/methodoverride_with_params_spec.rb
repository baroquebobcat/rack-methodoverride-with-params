lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'rack-methodoverride-with-params'

describe Rack::MethodOverrideWithParams do
  let(:in_env) { {} }
  let(:out_env) { subject.call(in_env) }
  let(:app) {lambda {|env| env}}
  subject { Rack::MethodOverrideWithParams.new(app)}
    
  describe "a get request" do
    it { app.should_receive(:call).with(in_env); out_env }
    it { out_env.should == in_env }
  end

  describe "a post request" do
    before { 
      in_env['REQUEST_METHOD']='POST'
      in_env['rack.input'] = in_env['form_input'] = ''
      in_env['rack.request.form_input'] = ''
      in_env["rack.request.form_hash"] = {}
    }
    Rack::MethodOverrideWithParams::HTTP_METHODS.each do |method|
      describe "with _method = #{method} as a post param" do
        before { in_env["rack.request.form_hash"] = {'_method' => method} }
     
        it { out_env['REQUEST_METHOD'].should == method }
      end

      describe 'with _method = #{method} as a query param' do
        before { in_env['QUERY_STRING'] = "_method=#{method}" }
        
        it { out_env['REQUEST_METHOD'].should == method }
      end
    end
  end
end
