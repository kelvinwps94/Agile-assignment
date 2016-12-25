using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Xml;
using System.Xml.XmlConfiguration;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace EzCabAssignment
{
    public partial class AdminDriverManagement : System.Web.UI.Page
    {

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label ICNumber = ((Label)GridView1.Rows[e.RowIndex].FindControl("Label1"));
            TextBox Name = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox1"));
            Label Email = ((Label)GridView1.Rows[e.RowIndex].FindControl("Label8"));
            Label Gender = ((Label)GridView1.Rows[e.RowIndex].FindControl("Label3"));
            TextBox TaxiCompany = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox2"));
            TextBox ExpiredDrivingLicense = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox3"));
            TextBox ContactNo = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox4"));
            TextBox CarPlateNo = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox5"));

            XmlDocument xmldoc = new XmlDocument();
            xmldoc.Load(Server.MapPath("~/Driver.xml"));

            XmlNodeList NodeList = xmldoc.SelectNodes("DriverInformation/Drivers");

            foreach (XmlNode item in NodeList)
            {
                if (item.ChildNodes[0].InnerText == ICNumber.Text)
                {
                    item.ChildNodes[1].InnerText = Name.Text;
                    item.ChildNodes[2].InnerText = Email.Text;
                    item.ChildNodes[3].InnerText = Gender.Text;
                    item.ChildNodes[4].InnerText = TaxiCompany.Text;
                    item.ChildNodes[5].InnerText = ExpiredDrivingLicense.Text;
                    item.ChildNodes[6].InnerText = ContactNo.Text;
                    item.ChildNodes[7].InnerText = CarPlateNo.Text;
                }
            }

            xmldoc.Save(Server.MapPath("~/Driver.xml"));
            GridView1.EditIndex = -1;

            string cs = ConfigurationManager.ConnectionStrings["EzCabConnectionString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                DataSet ds = new DataSet();
                ds.ReadXml(Server.MapPath("~/Driver.xml"));

                DataTable dtDrv = ds.Tables["Drivers"];
                con.Open();

                SqlCommand cmd = new SqlCommand("TRUNCATE TABLE Driver", con);
                cmd.ExecuteNonQuery();

                using (SqlBulkCopy bc2 = new SqlBulkCopy(con))
                {
                    bc2.DestinationTableName = "Driver";
                    bc2.ColumnMappings.Add("ICNo", "ICNo");
                    bc2.ColumnMappings.Add("Name", "Name");
                    bc2.ColumnMappings.Add("Email", "Email");
                    bc2.ColumnMappings.Add("Gender", "Gender");
                    bc2.ColumnMappings.Add("TaxiCompany", "TaxiCompany");
                    bc2.ColumnMappings.Add("ExpiredDrivingLicense", "ExpiredDrivingLicense");
                    bc2.ColumnMappings.Add("ContactNo", "ContactNo");
                    bc2.ColumnMappings.Add("CarPlateNo", "CarPlateNo");
                    bc2.WriteToServer(dtDrv);
                }

            }
            GetAllRecordsFromXML();
        }

    }

}