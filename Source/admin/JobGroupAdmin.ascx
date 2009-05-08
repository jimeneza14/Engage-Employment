<%@ Import namespace="System.Globalization"%>
<%@ Import namespace="DotNetNuke.Services.Localization"%>
<%@ Control language="C#" Inherits="Engage.Dnn.Employment.Admin.JobGroupAdmin" AutoEventWireup="true" Codebehind="JobGroupAdmin.ascx.cs" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>

<span class="Head"><dnn:Label ResourceKey="lblJobGroupsHeader" runat="server" /></span>

<asp:MultiView ID="mvAuthorization" runat="server">
    <asp:View ID="vwUnauthorized" runat="server">
        <asp:Label runat="server" CssClass="NormalRed" resourcekey="Unauthorized" />
    </asp:View>
    <asp:View ID="vwJobGroups" runat="server">
        <table class="employmentTable">
            <tr><td>
                <asp:Button ID="btnNewJobGroup" runat="server" resourcekey="btnNewJobGroup"  />
            </td><td class="labelColumn">
                <asp:Button ID="btnEditAssignments" runat="server" resourcekey="btnEditAssignments" />
            </td></tr>
        </table>
        <asp:GridView ID="gvJobGroups" runat="server" AutoGenerateColumns="false" CssClass="employmentTable" BorderStyle="None" GridLines="None">
            <AlternatingRowStyle CssClass="DataGrid_AlternatingItem" />
            <RowStyle CssClass="DataGrid_Item" />
            <SelectedRowStyle CssClass="DataGrid_SelectedItem" />
            <HeaderStyle CssClass="DataGrid_Header" />
            <FooterStyle CssClass="DataGrid_Footer" />
            <EmptyDataTemplate>
                <asp:Label ID="lblNoJobGroups" runat="server" resourcekey="lblNoJobGroups" />
            </EmptyDataTemplate>
            <Columns>
                <asp:TemplateField HeaderText="Name">
                    <ItemTemplate>
                        <span class="Normal"><%# Eval("Name") %></span>
                        <asp:HiddenField id="hdnJobGroupId" runat="server" Value='<%#Eval("JobGroupId") %>'/>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtJobGroupName" runat="server" Text='<%# Bind("Name") %>' CssClass="NormalTextBox" />
                        <asp:HiddenField id="hdnJobGroupId" runat="server" Value='<%#Eval("JobGroupId") %>'/>
                        <asp:RequiredFieldValidator ID="rfvJobGroupEdit" runat="server" ControlToValidate="txtJobGroupName" Display="None" CssClass="NormalRed" ValidationGroup="JobGroupEdit" resourcekey="rfvNewJobGroup" />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemStyle CssClass="labelColumn" />
                    <ItemTemplate>
                        <asp:Button ID="btnEdit" runat="server" resourcekey="Edit" CommandName="Edit" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Button ID="btnSave" runat="server" resourcekey="Save" CommandName="Save" CommandArgument='<%# Container.DataItemIndex %>' ValidationGroup="JobGroupEdit" />
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemStyle CssClass="labelColumn" />
                    <ItemTemplate>
                        <asp:Button ID="btnDelete" runat="server" resourcekey="Delete" CommandName="Delete" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Button ID="btnCancel" runat="server" resourcekey="Cancel" CommandName="Cancel"/>
                    </EditItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:CustomValidator ID="cvJobGroupEdit" runat="server" Display="None" CssClass="NormalRed" ValidationGroup="JobGroupEdit" resourcekey="cvNewJobGroup" />
        <asp:ValidationSummary runat="server" CssClass="NormalRed" DisplayMode="BulletList" ValidationGroup="JobGroupEdit" />
        <asp:Panel ID="pnlNewJobGroup" runat="server" Visible="false">
            <table class="employmentTable">
                <tr id="rowNewJobGroupHeader" runat="server" visible="false"><th>
                    <asp:Label ID="lblNewJobGroupHeader" runat="server" resourcekey="Name.Header" />
                </th><th></th></tr>
                <tr class='<%=pnlNewJobGroup.CssClass %>'><td>
                    <asp:TextBox ID="txtNewJobGroupName" runat="server" CssClass="NormalTextBox" />
                </td><td class="labelColumn">
                    <asp:Button ID="btnSaveNewJobGroup" runat="server" resourcekey="btnSaveNewJobGroup" ValidationGroup="NewJobGroup" />
                </td></tr>
                <tr><td colspan="2">
                    <asp:CustomValidator ID="cvNewJobGroup" runat="server" ControlToValidate="txtNewJobGroupName" Display="Dynamic" CssClass="NormalRed" ValidationGroup="NewJobGroup" resourcekey="cvNewJobGroup" />
                    <asp:RequiredFieldValidator ID="rfvNewJobGroup" runat="server" ControlToValidate="txtNewJobGroupName" Display="Dynamic" CssClass="NormalRed" ValidationGroup="NewJobGroup" resourcekey="rfvNewJobGroup" />
                </td></tr>
            </table>
        </asp:Panel>
    </asp:View>
    <asp:View ID="vwAssignment" runat="server">
        <%--<span class="Head"><dnn:Label ResourceKey="lblJobsJobGroupHeader" runat="server" /></span>--%>
        <table class="settingsTable">
            <tr><td>
            </td><td class="labelColumn">
                <asp:Button ID="btnEditJobGroups" runat="server" resourcekey="btnEditJobGroups" />
            </td></tr>
        </table>

        <asp:Repeater ID="rpJobs" runat="server">
            <HeaderTemplate>
                <table border="0" class="employmentTable">
                <tr>
                    <th><asp:Label ID="lblJobsHeader" runat="server" CssClass="SubHead" resourcekey="lblJobsHeader" /></th>
                    <th><asp:Label ID="lblJobGroupsHeader" runat="server" CssClass="SubHead" resourcekey="lblJobGroupsHeader" /></th>
                </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr class='<%# Container.ItemIndex % 2 == 0 ? "DataGrid_Item" : "DataGrid_AlternatingItem" %>'>
                    <td class="jobLabelCell">
                        <%# string.Format(CultureInfo.CurrentCulture, Localization.GetString("lbJobInLocation", LocalResourceFile), Eval("JobTitle"), Eval("LocationName"), Eval("StateName")) %>
                        <asp:HiddenField ID="hdnJobId" runat="server" Value='<%# Eval("JobId") %>' />
                    </td>
                    <td>
                        <asp:CheckBoxList ID="cblJobGroups" runat="server" CssClass="checkBoxList" RepeatDirection="Horizontal" RepeatLayout="Table" RepeatColumns="2"  />
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>
        <asp:Button ID="btnSaveAssignments" runat="server" resourcekey="btnSaveAssignments" />
    </asp:View>
</asp:MultiView>
