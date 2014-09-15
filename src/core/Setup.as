package core
{
	import gametheater.gt;
	import gametheater.gtObject;
	import gametheater.core.gtApp;
	import gametheater.plugins.console.gtConsolePlugin;
	import gametheater.plugins.deviceid.gtDeviceID;
	import gametheater.plugins.netstat.gtNetworkStatus;
	
	public final class Setup extends gtObject
	{
		public function onCreate():void
		{
			gtApp.loadPlugin(gtConsolePlugin);
			gtApp.loadPlugin(gtNetworkStatus);
			gtApp.loadPlugin(gtDeviceID);
			
			gt.create(FloxLogic);
			//gtApp.loadPlugin(gtFloxPlugin,"k2ybcKZLJ9VnUpeT", "3BgBtNdqV0z5Hn7W", FloxPlayer);
			
			if (platform.supports("ios"))
			{
				//gtApp.loadPlugin(gtInAppBillingPlugin);				
				//gtApp.loadPlugin(gtAppRater, ApplicationRater.IMPLEMENTATION_IOS, "903449298");
				log("platform set to iOS");
			}
			else if (platform.supports("android"))
			{
				//gtApp.loadPlugin(gtInAppBillingPlugin,"MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAoel1iuvvZzGmD97DtyxQh/q8iJNZx4mFmyuEFhju/zyxWovZqtQgnaNydn5YP5OIPBWjBcuaxy3ukA9rXMA0E0sWpFc6W3FuI4RJY8BGlLrqh5Xlc4kfuiBM4MmmcGLl15NGu6iGNVAaD0m3dk79aKzgpN4ErAoHIv04+4F9gaTMt7GrcEJhNp0OSYc/tFceL+ZLaBcyWSYPc9vvO+DviKCwaZchc3W3RjOotJMrqPJ+NbpQoBELLSwIIUO99f3mJbT70CqfwE1Fks2MtlWznaWNbsoE/38HZs579Out7bdBNzKzhaTxBjAelR8TTtKq8BFj2vH1a39SdqoUj/de1QIDAQAB");
				//gtApp.loadPlugin(gtAppRater, ApplicationRater.IMPLEMENTATION_ANDROID, "air." + gtMobileApp(app).bundleid);
				log("platform set to android");
			}
			
			//gtApp.loadPlugin(gtFacebookPlugin,"238356983020432",DEBUG);

		}
	}
}