<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.XtraCharts.v14.2, Version=14.2.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.XtraCharts" TagPrefix="cc1" %>

<%@ Register Assembly="DevExpress.XtraCharts.v14.2.Web, Version=14.2.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>


<%@ Register Assembly="DevExpress.Web.v14.2, Version=14.2.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>

    <form id="form1" runat="server">
        <!--WebChart Toolbar-->
        <div>
            <dx:ASPxMenu ID="mnuToolbar" runat="server" ClientInstanceName="mnuToolbar" ApplyItemStyleToTemplates="True" EnableViewState="False" ShowAsToolbar="true">
                <Items>
                    <dx:MenuItem Name="mnuPrint" Text="" ToolTip="Print the chart">
                        <Image Url="~/Toolbar/BtnPrint.png" />
                    </dx:MenuItem>
                    <dx:MenuItem Name="mnuSaveToDisk" Text="" ToolTip="Export a chart and save it to the disk" BeginGroup="True">
                        <Image Url="~/Toolbar/BtnSave.png" />
                    </dx:MenuItem>
                    <dx:MenuItem Name="mnuSaveToWindow" Text="" ToolTip="Export a chart and show it in a new window">
                        <Image Url="~/Toolbar/BtnSaveWindow.png" />
                    </dx:MenuItem>
                    <dx:MenuItem Name="mnuFormat">
                        <Template>
                            <dx:ASPxComboBox runat="server" Width="60px" ValueType="System.String" ID="cbFormat" SelectedIndex="0" ClientInstanceName="cbFormat">
                                <Items>
                                    <dx:ListEditItem Value="pdf" Text="pdf" />
                                    <dx:ListEditItem Value="xls" Text="xls" />
                                    <dx:ListEditItem Value="png" Text="png" />
                                    <dx:ListEditItem Value="jpeg" Text="jpeg" />
                                    <dx:ListEditItem Value="bmp" Text="bmp" />
                                    <dx:ListEditItem Value="tiff" Text="tiff" />
                                    <dx:ListEditItem Value="gif" Text="gif" />
                                </Items>
                            </dx:ASPxComboBox>
                        </Template>
                    </dx:MenuItem>
                    <dx:MenuItem Name="mnuLblAppearance" BeginGroup="True">
                        <Template>
                            <dx:ASPxLabel ID="lblAppearance" Text="Chart&nbsp;Appearance:" runat="server" />
                        </Template>
                    </dx:MenuItem>
                    <dx:MenuItem Name="mnuAppearance">
                        <Template>
                            <dx:ASPxComboBox runat="server" Width="120px" ValueType="System.String" ID="cbAppearance" ClientInstanceName="cbAppearance">
                                <ClientSideEvents SelectedIndexChanged="function(s, e) { chart.PerformCallback(&quot;Appearance&quot;); }" />
                            </dx:ASPxComboBox>
                        </Template>
                    </dx:MenuItem>
                    <dx:MenuItem Name="mnuLblPalette">
                        <Template>
                            <dx:ASPxLabel ID="lblPalette" Text="Palette:" runat="server" />
                        </Template>
                    </dx:MenuItem>
                    <dx:MenuItem Name="mnuPalette">
                        <Template>
                            <dx:ASPxComboBox runat="server" Width="120px" ValueType="System.String" ID="cbPalette" ClientInstanceName="cbPalette">
                                <ClientSideEvents SelectedIndexChanged="function(s, e) { chart.PerformCallback(&quot;Palette&quot;); }" />
                            </dx:ASPxComboBox>
                        </Template>
                    </dx:MenuItem>
                </Items>
                <ClientSideEvents ItemClick="function(s, e) {
    if (e.item.name == 'mnuPrint')
	    chart.Print();
    if (e.item.name == 'mnuSaveToDisk')
        chart.SaveToDisk(cbFormat.GetText());
    if (e.item.name == 'mnuSaveToWindow')
        chart.SaveToWindow(cbFormat.GetText());
}" />
            </dx:ASPxMenu>
        </div>
        <br />
        <!--WebChartControl-->
        <dxchartsui:WebChartControl ID="webChartControl" runat="server" ClientInstanceName="chart" Height="417px" Width="647px" OnCustomCallback="chart_CustomCallback">
            <seriesserializable>
                    <cc1:series argumentscaletype="Numerical" 
                        name="Series 1" ><Points>
<cc1:SeriesPoint Values="1" ArgumentSerializable="1"></cc1:SeriesPoint>
<cc1:SeriesPoint Values="2" ArgumentSerializable="2"></cc1:SeriesPoint>
<cc1:SeriesPoint Values="3" ArgumentSerializable="3"></cc1:SeriesPoint>
<cc1:SeriesPoint Values="4" ArgumentSerializable="4"></cc1:SeriesPoint>
<cc1:SeriesPoint Values="5" ArgumentSerializable="5"></cc1:SeriesPoint>
</Points>
<LabelSerializable>
                    <cc1:SideBySideBarSeriesLabel LineVisible="True">
                    </cc1:SideBySideBarSeriesLabel>
                </LabelSerializable>


</cc1:series>
                    <cc1:series argumentscaletype="Numerical" 
                        name="Series 2" ><Points>
<cc1:SeriesPoint Values="5" ArgumentSerializable="1"></cc1:SeriesPoint>
<cc1:SeriesPoint Values="1" ArgumentSerializable="2"></cc1:SeriesPoint>
<cc1:SeriesPoint Values="2" ArgumentSerializable="3"></cc1:SeriesPoint>
<cc1:SeriesPoint Values="3" ArgumentSerializable="4"></cc1:SeriesPoint>
<cc1:SeriesPoint Values="4" ArgumentSerializable="5"></cc1:SeriesPoint>
</Points>



<LabelSerializable>
                    <cc1:SideBySideBarSeriesLabel LineVisible="True">
                    </cc1:SideBySideBarSeriesLabel>
                </LabelSerializable>

</cc1:series>
                    <cc1:series argumentscaletype="Numerical" 
                        name="Series 3" ><Points>
<cc1:SeriesPoint Values="4" ArgumentSerializable="1"></cc1:SeriesPoint>
<cc1:SeriesPoint Values="5" ArgumentSerializable="2"></cc1:SeriesPoint>
<cc1:SeriesPoint Values="1" ArgumentSerializable="3"></cc1:SeriesPoint>
<cc1:SeriesPoint Values="2" ArgumentSerializable="4"></cc1:SeriesPoint>
<cc1:SeriesPoint Values="3" ArgumentSerializable="5"></cc1:SeriesPoint>
</Points>

<LabelSerializable>
                    <cc1:SideBySideBarSeriesLabel LineVisible="True">
                    </cc1:SideBySideBarSeriesLabel>
                </LabelSerializable>


</cc1:series>
                </seriesserializable>
            <seriestemplate>
                    
                   <LabelSerializable>
                    <cc1:SideBySideBarSeriesLabel LineVisible="True">
                    </cc1:SideBySideBarSeriesLabel>
                </LabelSerializable>
                   
                
                </seriestemplate>
            <clientsideevents endcallback="function (s, e) {
	for (var i = 0; i &lt; cbPalette.GetItemCount(); i++) {
		if (cbPalette.GetItem(i).value == s.GetChart().paletteName) {
			cbPalette.SetSelectedIndex(i);
		}
	}
}" />
            <diagramserializable>
                <cc1:XYDiagram>
                    <axisx visibleinpanesserializable="-1">
<Range SideMarginsEnabled="True"></Range>
</axisx>
                    <axisy visibleinpanesserializable="-1">
<Range SideMarginsEnabled="True"></Range>
</axisy>
                    </cc1:XYDiagram>
                </diagramserializable>

        </dxchartsui:WebChartControl>
    </form>

</body>
</html>
