using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace entity_framework_task
{
    public partial class task1 : System.Web.UI.Page
    {
        voteEntities2 v = new voteEntities2();
        protected void Page_Load(object sender, EventArgs e)
        {
            // GridView1.DataSource = v.Customers1.ToList();
            //GridView1.DataBind();
            var user = (from c in v.Customers1
                        join ct in v.Cities on c.City equals ct.City_id

                        select new
                        {
                            c.CustomerName,
                            c.Age,
                            c.Email,
                            c.Phone,
                            ct.City1,
                            c.Photo


                        }).ToList();
            GridView1.DataSource = user.ToList();
            GridView1.DataBind();

            if (!IsPostBack)
            {

                var x = from City in v.Cities select City;
                DropDownList1.DataSource = x.ToList();
                DropDownList1.DataTextField = "City1";
                DropDownList1.DataValueField = "City_id";
                DropDownList1.DataBind();

             
            }
            lblNum.Text = "Customers Number :" +(from item in v.Customers1 select item).Count().ToString();
            lblAvg.Text = "Avarage Age :" + (from item in v.Customers1 select item.Age).Average().ToString();
            lblMax.Text = "Max Age :" + (from item in v.Customers1 select item.Age).Max().ToString();

        }
        

        protected void Button1_Click1(object sender, EventArgs e)
        {
            Customers1 insertTest = new Customers1();
            //Guid guid = Guid.NewGuid();
            //  insertTest.Id = guid.ToString();
            insertTest.CustomerName = name.Value.ToString();
            insertTest.Age = int.Parse(age.Value);
            insertTest.Email = email.Value.ToString();
            insertTest.City = int.Parse(DropDownList1.SelectedValue);
            insertTest.Phone = int.Parse(phone.Value);
            string image = "";
            if (FileUpload1.HasFile)
            {
                image = "/img/" + FileUpload1.FileName;
                FileUpload1.SaveAs(Server.MapPath("/img/") + FileUpload1.FileName);
            }
            insertTest.Photo=image;
            v.Customers1.Add(insertTest);
            v.SaveChanges();
           
            var user = (from c in v.Customers1
                        join ct in v.Cities on c.City equals ct.City_id

                        select new
                        {
                            c.CustomerName,
                            c.Age,
                            c.Email,
                            c.Phone,
                            ct.City1,
                            c.Photo


                        }).ToList();
            GridView1.DataSource = user.ToList();
            GridView1.DataBind();

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            voteEntities2 v = new voteEntities2();
            //int searchID = int.Parse(search.Value);
            string searchname = search.Value.Trim();
            var joi = (from cc in v.Customers1
                       join ct in v.Cities on cc.City equals ct.City_id
                       where cc.CustomerID.ToString().Contains(searchname) || (cc.CustomerName.Contains(searchname))
                       select new
                       {
                           cc.CustomerName,
                           cc.Age,
                           ct.City1,
                           cc.Email,
                           cc.Phone,
                           cc.Photo
                       }).ToList();

            GridView1.DataSource = joi.ToList();
            GridView1.DataBind();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //GridView1.Columns[6].Visible = false;
           //e.Row.Cells[6].Visible = false;
            //this.GridView1.Columns[6].Visible = false;
        }
    }
}