using System;
using System.Web.UI;
using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxMenu;
using DevExpress.XtraCharts.Web;

public partial class _Default : Page {
    ASPxComboBox cbAppearance;
    ASPxComboBox cbPalette;

    void PrepareComboBox(ASPxComboBox comboBox, string[] items, string defaultItem) {
        comboBox.Items.Clear();
        comboBox.Items.AddRange(items);
        comboBox.SelectedIndex = defaultItem != null ? comboBox.Items.IndexOfText(defaultItem) : 0;
    }
    protected void Page_Init(object sender, EventArgs e) {
        MenuItem mnuAppearance = mnuToolbar.Items.FindByName("mnuAppearance");
        if (mnuAppearance != null) {
            cbAppearance = mnuAppearance.FindControl("cbAppearance") as ASPxComboBox;
            if (cbAppearance != null)
                PrepareComboBox(cbAppearance, webChartControl.GetAppearanceNames(), webChartControl.AppearanceName);
        }
        MenuItem mnuPalette = mnuToolbar.Items.FindByName("mnuPalette");
        if (mnuPalette != null) {
            cbPalette = mnuPalette.FindControl("cbPalette") as ASPxComboBox;
            if (cbPalette != null)
                PrepareComboBox(cbPalette, webChartControl.GetPaletteNames(), webChartControl.PaletteName);
        }
    }
    protected void chart_CustomCallback(object sender, CustomCallbackEventArgs e) {
        switch (e.Parameter) {
            case "Palette":
                if (cbPalette != null)
                    webChartControl.PaletteName = cbPalette.Text;
                break;
            case "Appearance":
                if (cbAppearance != null) {
                    webChartControl.AppearanceName = cbAppearance.Text;
                    if (cbPalette != null)
                        cbPalette.SelectedIndex = cbPalette.Items.IndexOfText(webChartControl.PaletteName);
                }
                break;
        }
    }
}