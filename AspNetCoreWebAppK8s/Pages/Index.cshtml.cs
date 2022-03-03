using Microsoft.AspNetCore.Mvc.RazorPages;
using System;

namespace AspNetCoreWebAppK8s.Pages
{
    public class IndexModel : PageModel
    {
        public void OnGet()
        {
            ViewData["MachineName"] = Environment.MachineName;
            ViewData["DatabaseKey"] = "N/A";
        }
    }
}
