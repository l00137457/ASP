using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(SparePartWeb.Startup))]
namespace SparePartWeb
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
