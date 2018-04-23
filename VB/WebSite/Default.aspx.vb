Imports Microsoft.VisualBasic
Imports System
Imports System.Web.UI
Imports DevExpress.Web.ASPxEditors
Imports DevExpress.Web.ASPxMenu
Imports DevExpress.XtraCharts.Web

Partial Public Class _Default
	Inherits Page
	Private cbAppearance As ASPxComboBox
	Private cbPalette As ASPxComboBox

	Private Sub PrepareComboBox(ByVal comboBox As ASPxComboBox, ByVal items() As String, ByVal defaultItem As String)
		comboBox.Items.Clear()
		comboBox.Items.AddRange(items)
		If defaultItem IsNot Nothing Then
			comboBox.SelectedIndex = comboBox.Items.IndexOfText(defaultItem)
		Else
			comboBox.SelectedIndex = 0
		End If
	End Sub
	Protected Sub Page_Init(ByVal sender As Object, ByVal e As EventArgs)
		Dim mnuAppearance As MenuItem = mnuToolbar.Items.FindByName("mnuAppearance")
		If mnuAppearance IsNot Nothing Then
			cbAppearance = TryCast(mnuAppearance.FindControl("cbAppearance"), ASPxComboBox)
			If cbAppearance IsNot Nothing Then
				PrepareComboBox(cbAppearance, webChartControl.GetAppearanceNames(), webChartControl.AppearanceName)
			End If
		End If
		Dim mnuPalette As MenuItem = mnuToolbar.Items.FindByName("mnuPalette")
		If mnuPalette IsNot Nothing Then
			cbPalette = TryCast(mnuPalette.FindControl("cbPalette"), ASPxComboBox)
			If cbPalette IsNot Nothing Then
				PrepareComboBox(cbPalette, webChartControl.GetPaletteNames(), webChartControl.PaletteName)
			End If
		End If
	End Sub
	Protected Sub chart_CustomCallback(ByVal sender As Object, ByVal e As CustomCallbackEventArgs)
		Select Case e.Parameter
			Case "Palette"
				If cbPalette IsNot Nothing Then
					webChartControl.PaletteName = cbPalette.Text
				End If
			Case "Appearance"
				If cbAppearance IsNot Nothing Then
					webChartControl.AppearanceName = cbAppearance.Text
					If cbPalette IsNot Nothing Then
						cbPalette.SelectedIndex = cbPalette.Items.IndexOfText(webChartControl.PaletteName)
					End If
				End If
		End Select
	End Sub
End Class