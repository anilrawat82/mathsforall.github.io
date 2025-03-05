<%@ Page Title="" Language="C#" MasterPageFile="~/Models/WebPages/Master.Master" AutoEventWireup="true" CodeBehind="Permutation.aspx.cs" Inherits="DesignAlgorithms.Models.WebPages.Permutation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link type="text/css" rel="stylesheet" href="../Css/LatestCommon.css" />
    <link type="text/css" rel="stylesheet" href="../Css/Elementary.css" />
    <link type="text/css" rel="stylesheet" href="../Css/Common.css" />
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div>
            <h1 class="PageNameHeading"> Permutation and Combination</h1>
        </div>
        <div>
    <table>
        <tr>
            <td>
                <label>
                    <h2  class="NameDateScore">Name</h2>
                    <input  id="txtName" type="text"  runat="server" name="txtName" class="textName" />
                </label>
            </td>
            <td>
                <label>
                    <h2 class="NameDateScore">Date</h2>
                    <asp:Label ID="LblDateTime" runat="server" Text="Label" class="textDate"></asp:Label>
                </label>
            </td>
            <td>
                <label>
                    <h2 class="NameDateScore">Score :</h2>
                    <h2 id="hScore" class="textScore"></h2>

                </label>
            </td>
        </tr>
        <tr>
            <td class="InputID">Total Amount in a Set (n)</td>
            <td colspan="2"> <asp:TextBox runat="server" id="txtN" class="MatrixOrder" /><br /></td>


        </tr>
        <tr>
            <td class="InputID"> Amount in each Sub-Set (r)</td>
            <td colspan="2"><asp:TextBox runat="server" id="txtR" class="MatrixOrder" /></td>

        </tr>
        <tr>
            <td colspan ="3"  class="InputID"> 
                 <asp:RadioButton ID="rdCombination" runat="server" Text="Combination" GroupName="PerComb"   Checked="True" />
                <asp:RadioButton ID="rdPermutation" runat="server" Text="Permutation" GroupName="PerComb" />
                </td>
        </tr>
           <tr>
            <td colspan ="3" > 
                 <asp:Button ID="Button1" runat="server" Text="Solve" OnClick="Button1_Click"    /></td>
            
            
            

        </tr>
         <tr>
            <td colspan ="3" > 
        <asp:Label ID="Label1" runat="server"></asp:Label>
                </td>
             </tr>
    </table>
  
</asp:Content>
