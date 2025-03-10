<%@ Page Language="VB" AutoEventWireup="true"  CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.XtraCharts.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.XtraCharts" TagPrefix="cc1" %>

<%@ Register Assembly="DevExpress.XtraCharts.v13.1.Web, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxMenu" TagPrefix="dxm" %>
<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <center>
        <form id="form1" runat="server">
            <!--WebChart Toolbar-->
            <dxm:ASPxMenu ID="mnuToolbar" runat="server" ClientInstanceName="mnuToolbar" ApplyItemStyleToTemplates="True">
                <Items>
                    <dxm:MenuItem Name="mnuPrint" Text="" ToolTip="Print the chart">
                        <Image Url="~/Toolbar/BtnPrint.png" />
                    </dxm:MenuItem>
                    <dxm:MenuItem Name="mnuSaveToDisk" Text="" ToolTip="Export a chart and save it to the disk" BeginGroup="True">
                        <Image Url="~/Toolbar/BtnSave.png" />
                    </dxm:MenuItem>
                    <dxm:MenuItem Name="mnuSaveToWindow" Text="" ToolTip="Export a chart and show it in a new window">
                        <Image Url="~/Toolbar/BtnSaveWindow.png" />
                    </dxm:MenuItem>
                    <dxm:MenuItem Name="mnuFormat">
                        <Template>
                            <dxe:ASPxComboBox runat="server" Width="60px" ValueType="System.String" ID="cbFormat" SelectedIndex="0" ClientInstanceName="cbFormat">
                                <Items>
                                    <dxe:ListEditItem Value="pdf" Text="pdf" />
                                    <dxe:ListEditItem Value="xls" Text="xls" />
                                    <dxe:ListEditItem Value="png" Text="png" />
                                    <dxe:ListEditItem Value="jpeg" Text="jpeg" />
                                    <dxe:ListEditItem Value="bmp" Text="bmp" />
                                    <dxe:ListEditItem Value="tiff" Text="tiff" />
                                    <dxe:ListEditItem Value="gif" Text="gif" />
                                </Items>
                            </dxe:ASPxComboBox>
                        </Template>
                    </dxm:MenuItem>
                    <dxm:MenuItem Name="mnuLblAppearance" BeginGroup="True">
                        <Template>
                            <dxe:ASPxLabel ID="lblAppearance" Text="Chart&nbsp;Appearance:" runat="server" />
                        </Template>
                    </dxm:MenuItem>
                    <dxm:MenuItem Name="mnuAppearance">
                        <Template>
                            <dxe:ASPxComboBox runat="server" Width="120px" ValueType="System.String" ID="cbAppearance" ClientInstanceName="cbAppearance">
                                <ClientSideEvents SelectedIndexChanged="function(s, e) { chart.PerformCallback(&quot;Appearance&quot;); }" />
                            </dxe:ASPxComboBox>
                        </Template>
                    </dxm:MenuItem>
                    <dxm:MenuItem Name="mnuLblPalette">
                        <Template>
                            <dxe:ASPxLabel ID="lblPalette" Text="Palette:" runat="server"/>
                        </Template>
                    </dxm:MenuItem>
                    <dxm:MenuItem Name="mnuPalette">
                        <Template>
                            <dxe:ASPxComboBox runat="server" Width="120px" ValueType="System.String" ID="cbPalette" ClientInstanceName="cbPalette">
                                <ClientSideEvents SelectedIndexChanged="function(s, e) { chart.PerformCallback(&quot;Palette&quot;); }" />
                            </dxe:ASPxComboBox>
                        </Template>
                    </dxm:MenuItem>
                </Items>
                <ClientSideEvents ItemClick="function(s, e) {
    if (e.item.name == 'mnuPrint')
	    chart.Print();
    if (e.item.name == 'mnuSaveToDisk')
        chart.SaveToDisk(cbFormat.GetText());
    if (e.item.name == 'mnuSaveToWindow')
        chart.SaveToWindow(cbFormat.GetText());
}" />
            </dxm:ASPxMenu>
            <!--WebChartControl-->
            <dxchartsui:WebChartControl ID="webChartControl" runat="server" ClientInstanceName="chart"  Height="417px" Width="647px" OnCustomCallback="chart_CustomCallback">
                <SeriesSerializable>
                    <cc1:series argumentscaletype="Numerical" 
                        name="Series 1"  ><Points>
<cc1:SeriesPoint Values="1" ArgumentSerializable="1"></cc1:SeriesPoint>
<cc1:SeriesPoint Values="2" ArgumentSerializable="2"></cc1:SeriesPoint>
<cc1:SeriesPoint Values="3" ArgumentSerializable="3"></cc1:SeriesPoint>
<cc1:SeriesPoint Values="4" ArgumentSerializable="4"></cc1:SeriesPoint>
<cc1:SeriesPoint Values="5" ArgumentSerializable="5"></cc1:SeriesPoint>
</Points>

<ViewSerializable>
<cc1:SideBySideBarSeriesView HiddenSerializableString="to be serialized"></cc1:SideBySideBarSeriesView>
</ViewSerializable>

<LabelSerializable>
<cc1:SideBySideBarSeriesLabel HiddenSerializableString="to be serialized" LineVisible="True" >
<FillStyle >
<OptionsSerializable>
<cc1:SolidFillOptions HiddenSerializableString="to be serialized"></cc1:SolidFillOptions>
</OptionsSerializable>
</FillStyle>
</cc1:SideBySideBarSeriesLabel>
</LabelSerializable>

<PointOptionsSerializable>
<cc1:PointOptions HiddenSerializableString="to be serialized"></cc1:PointOptions>
</PointOptionsSerializable>

<LegendPointOptionsSerializable>
<cc1:PointOptions HiddenSerializableString="to be serialized"></cc1:PointOptions>
</LegendPointOptionsSerializable>
</cc1:series>
                    <cc1:series argumentscaletype="Numerical" 
                        name="Series 2"  ><Points>
<cc1:SeriesPoint Values="5" ArgumentSerializable="1"></cc1:SeriesPoint>
<cc1:SeriesPoint Values="1" ArgumentSerializable="2"></cc1:SeriesPoint>
<cc1:SeriesPoint Values="2" ArgumentSerializable="3"></cc1:SeriesPoint>
<cc1:SeriesPoint Values="3" ArgumentSerializable="4"></cc1:SeriesPoint>
<cc1:SeriesPoint Values="4" ArgumentSerializable="5"></cc1:SeriesPoint>
</Points>

<ViewSerializable>
<cc1:SideBySideBarSeriesView HiddenSerializableString="to be serialized"></cc1:SideBySideBarSeriesView>
</ViewSerializable>

<LabelSerializable>
<cc1:SideBySideBarSeriesLabel HiddenSerializableString="to be serialized" LineVisible="True" >
<FillStyle >
<OptionsSerializable>
<cc1:SolidFillOptions HiddenSerializableString="to be serialized"></cc1:SolidFillOptions>
</OptionsSerializable>
</FillStyle>
</cc1:SideBySideBarSeriesLabel>
</LabelSerializable>

<PointOptionsSerializable>
<cc1:PointOptions HiddenSerializableString="to be serialized"></cc1:PointOptions>
</PointOptionsSerializable>

<LegendPointOptionsSerializable>
<cc1:PointOptions HiddenSerializableString="to be serialized"></cc1:PointOptions>
</LegendPointOptionsSerializable>
</cc1:series>
                    <cc1:series argumentscaletype="Numerical" 
                        name="Series 3"  ><Points>
<cc1:SeriesPoint Values="4" ArgumentSerializable="1"></cc1:SeriesPoint>
<cc1:SeriesPoint Values="5" ArgumentSerializable="2"></cc1:SeriesPoint>
<cc1:SeriesPoint Values="1" ArgumentSerializable="3"></cc1:SeriesPoint>
<cc1:SeriesPoint Values="2" ArgumentSerializable="4"></cc1:SeriesPoint>
<cc1:SeriesPoint Values="3" ArgumentSerializable="5"></cc1:SeriesPoint>
</Points>

<ViewSerializable>
<cc1:SideBySideBarSeriesView HiddenSerializableString="to be serialized"></cc1:SideBySideBarSeriesView>
</ViewSerializable>

<LabelSerializable>
<cc1:SideBySideBarSeriesLabel HiddenSerializableString="to be serialized" LineVisible="True" >
<FillStyle >
<OptionsSerializable>
<cc1:SolidFillOptions HiddenSerializableString="to be serialized"></cc1:SolidFillOptions>
</OptionsSerializable>
</FillStyle>
</cc1:SideBySideBarSeriesLabel>
</LabelSerializable>

<PointOptionsSerializable>
<cc1:PointOptions HiddenSerializableString="to be serialized"></cc1:PointOptions>
</PointOptionsSerializable>

<LegendPointOptionsSerializable>
<cc1:PointOptions HiddenSerializableString="to be serialized"></cc1:PointOptions>
</LegendPointOptionsSerializable>
</cc1:series>
                </SeriesSerializable>
                <SeriesTemplate  
                    >
                    <ViewSerializable>
<cc1:SideBySideBarSeriesView HiddenSerializableString="to be serialized">
                    </cc1:SideBySideBarSeriesView>
</ViewSerializable>
                    <LabelSerializable>
<cc1:SideBySideBarSeriesLabel HiddenSerializableString="to be serialized" LineVisible="True" >
                        <FillStyle >
                            <OptionsSerializable>
<cc1:SolidFillOptions HiddenSerializableString="to be serialized" />
</OptionsSerializable>
                        </FillStyle>
                    </cc1:SideBySideBarSeriesLabel>
</LabelSerializable>
                    <PointOptionsSerializable>
<cc1:PointOptions HiddenSerializableString="to be serialized">
                    </cc1:PointOptions>
</PointOptionsSerializable>
                    <LegendPointOptionsSerializable>
<cc1:PointOptions HiddenSerializableString="to be serialized">
                    </cc1:PointOptions>
</LegendPointOptionsSerializable>
                </SeriesTemplate>
                <ClientSideEvents EndCallback="function (s, e) {
	for (var i = 0; i &lt; cbPalette.GetItemCount(); i++) {
		if (cbPalette.GetItem(i).value == s.GetChart().paletteName) {
			cbPalette.SetSelectedIndex(i);
		}
	}
}" />
                <DiagramSerializable>
<cc1:XYDiagram>
                    <axisx visibleinpanesserializable="-1">
<Range SideMarginsEnabled="True"></Range>
</axisx>
                    <axisy visibleinpanesserializable="-1">
<Range SideMarginsEnabled="True"></Range>
</axisy>
                </cc1:XYDiagram>
</DiagramSerializable>
                <FillStyle >
                    <OptionsSerializable>
<cc1:SolidFillOptions HiddenSerializableString="to be serialized" />
</OptionsSerializable>
                </FillStyle>
            </dxchartsui:WebChartControl>
        </form>
    </center>
</body>
</html>
