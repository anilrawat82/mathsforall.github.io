<%@ Page Title="" Language="C#" MasterPageFile="~/Models/WebPages/DesignAlgo.Master" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="DesignAlgorithms.Models.WebPages.test" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .NewHeading
        {
            color:chartreuse;
            background-color:brown;
            font-family: 'Times New Roman';
        }
        .anupam
        {
            color:blue;
            background-color:chartreuse;
            font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
            font-size: 40px;
            border:10px orange ridge;
        }
         .anupam1
        {
            color:orangered;
            background-color:chartreuse;
            font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
            font-size: 40px;
            
            border-color:darkgray;
            
                

        }
         .anupam2
         {
             border-top:solid;
             border-bottom:dotted;
             border-left:solid;
             border-right:groove;
         }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
    <p>
  The infinite sum
  <math display="block">
    <mrow>
      <munderover>
        <mo>∑</mo>
        <mrow>
          <mi>n</mi>
          <mo>=</mo>
          <mn>1</mn>
        </mrow>
        <mrow>
          <mo>+</mo>
          <mn>∞</mn>
        </mrow>
      </munderover>
      <mfrac>
        <mn>1</mn>
        <msup>
          <mi>n</mi>
          <mn>2</mn>
        </msup>
      </mfrac>

    </mrow>
  </math>
  is equal to the real number
  <math display="inline">
    <mfrac>
      <msup>
        <mi>π</mi>
        <mn>2</mn>
      </msup>
      <mn>6</mn>
    </mfrac></math
  >.
</p>
    </div>
</asp:Content>
