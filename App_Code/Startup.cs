using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Experience.Startup))]
namespace Experience
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
