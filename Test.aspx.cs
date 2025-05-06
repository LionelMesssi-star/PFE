using DevExpress.Charts.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNetCore.Mvc;
using DevExpress.Emf;

public partial class Test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
}

namespace DevExtreme.NETCore.Demos.Controllers
{
    public class SplitterController : Controller
    {
        public override HitInfo CalcHitInfo(double x, double y)
        {
            throw new NotImplementedException();
        }

        public override void ClearSelection()
        {
            throw new NotImplementedException();
        }

        public override void Deselect(ModelElement element)
        {
            throw new NotImplementedException();
        }

        public override EmfMetafile ExportToMetafileModel(int width, int height)
        {
            throw new NotImplementedException();
        }

        public ActionResult Overview()
        {
            return (ActionResult)NewMethod();
        }

        private static object NewMethod()
        {
            return View();
        }

        private static object View()
        {
            throw new NotImplementedException();
        }

        public override void RenderChart(IChartRenderContext renderContext)
        {
            throw new NotImplementedException();
        }

        public override void Select(ModelElement element)
        {
            throw new NotImplementedException();
        }

        protected override void OnModelChanged()
        {
            throw new NotImplementedException();
        }
    }
}
