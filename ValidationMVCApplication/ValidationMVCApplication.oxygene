<?xml version="1.0" encoding="utf-8" standalone="yes"?>
<Project DefaultTargets="Build" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" ToolsVersion="4.0">
  <PropertyGroup>
    <OutputType>Library</OutputType>
    <RootNamespace>ValidationMVCApplication</RootNamespace>
    <AssemblyName>ValidationMVCApplication</AssemblyName>
    <Configuration Condition="'$(Configuration)' == ''">Debug</Configuration>
    <ProjectGuid>{EC6D9154-C674-4E7D-A1BE-632F480A6905}</ProjectGuid>
    <ProjectTypeGuids>{603c0e0b-db56-11dc-be95-000d561079b0};{349c5851-65df-11da-9384-00065b846f21};{656346D9-4656-40DA-A068-22D5425D4639}</ProjectTypeGuids>
    <Name>ValidationMVCApplication</Name>
    <TargetFramework>.NETFramework4.7.2</TargetFramework>
  </PropertyGroup>
  <PropertyGroup Condition=" '$(Configuration)' == 'Debug' ">
    <DefineConstants>DEBUG;TRACE;</DefineConstants>
    <Optimize>false</Optimize>
    <OutputPath>./bin</OutputPath>
    <GeneratePDB>True</GeneratePDB>
    <GenerateMDB>True</GenerateMDB>
  </PropertyGroup>
  <PropertyGroup Condition=" '$(Configuration)' == 'Release' ">
    <OutputPath>./bin</OutputPath>
    <Optimize>true</Optimize>
    <EnableAsserts>False</EnableAsserts>
  </PropertyGroup>
  <ItemGroup>
    <Reference Include="mscorlib" />
    <Reference Include="System" />
    <Reference Include="System.Data" />
    <Reference Include="System.Core">
      <RequiredTargetFramework>3.5</RequiredTargetFramework>
    </Reference>
    <Reference Include="System.Data.DataSetExtensions">
      <RequiredTargetFramework>3.5</RequiredTargetFramework>
    </Reference>
    <Reference Include="System.Xml.Linq">
      <RequiredTargetFramework>3.5</RequiredTargetFramework>
    </Reference>
    <Reference Include="System.Drawing" />
    <Reference Include="System.Web" />
    <Reference Include="System.Web.Abstractions" />
    <Reference Include="System.Web.Extensions" />
    <Reference Include="System.Web.Mvc" />
    <Reference Include="System.Web.Routing" />
    <Reference Include="System.Xml" />
    <Reference Include="System.Configuration" />
    <Reference Include="System.Web.Services" />
    <Reference Include="System.EnterpriseServices" />
    <Reference Include="System.Web.Mobile" />
    <ProjectReference Include="ValidationDomain">
      <Project>{60F1DCF6-2883-490F-9B0C-B1B57F8B895D}</Project>
      <ProjectFile>..\ValidationDomain\ValidationDomain.oxygene</ProjectFile>
      <Private>True</Private>
    </ProjectReference>
  </ItemGroup>
  <ItemGroup>
    <Content Include="Content\Site.css" />
    <Compile Include="Controllers\AccountController.pas" />
    <Compile Include="Controllers\EmployeeController.pas" />
    <Compile Include="Controllers\HomeController.pas" />
    <Content Include="Default.aspx" />
    <Compile Include="Default.aspx.pas">
      <Subtype>ASPXCodeBehind</Subtype>
      <DesignableClassName>ValidationMVCApplication._Default</DesignableClassName>
      <DependentUpon>Default.aspx</DependentUpon>
    </Compile>
    <Content Include="Global.asax" />
    <Compile Include="Global.asax.pas">
      <DependentUpon>Global.asax</DependentUpon>
    </Compile>
    <Compile Include="Properties\AssemblyInfo.pas" />
    <Content Include="Scripts\jquery-1.3.2.js" />
    <Content Include="Scripts\jquery-1.3.2.min.js" />
    <Content Include="Scripts\jquery-1.3.2.min-vsdoc.js" />
    <Content Include="Scripts\jquery-1.3.2-vsdoc.js" />
    <Content Include="Scripts\MicrosoftAjax.debug.js" />
    <Content Include="Scripts\MicrosoftAjax.js" />
    <Content Include="Scripts\MicrosoftMvcAjax.debug.js" />
    <Content Include="Scripts\MicrosoftMvcAjax.js" />
    <Content Include="Views\Account\ChangePassword.aspx" />
    <Content Include="Views\Account\ChangePasswordSuccess.aspx" />
    <Content Include="Views\Account\LogOn.aspx" />
    <Content Include="Views\Account\Register.aspx" />
    <Content Include="Views\Employee\Edit.aspx">
      <SubType>Content</SubType>
    </Content>
    <Content Include="Views\Employee\Index.aspx">
      <SubType>Content</SubType>
    </Content>
    <Content Include="Views\Home\_Index.aspx" />
    <Content Include="Views\Home\About.aspx" />
    <Content Include="Views\Shared\Error.aspx" />
    <Content Include="Views\Shared\LogOnUserControl.ascx" />
    <Content Include="Views\Shared\Site.Master" />
    <Content Include="Views\Web.config" />
    <Content Include="Web.config" />
  </ItemGroup>
  <ItemGroup>
    <Folder Include="Content\" />
    <Folder Include="Controllers\" />
    <Folder Include="Properties\" />
    <Folder Include="Scripts\" />
    <Folder Include="Views\" />
    <Folder Include="Views\Account\" />
    <Folder Include="Views\Home\" />
    <Folder Include="Views\Employee" />
    <Folder Include="Views\Shared\" />
  </ItemGroup>
  <ProjectExtensions>
    <VisualStudio>
      <FlavorProperties Guid="{349c5851-65df-11da-9384-00065b846f21}">
        <WebProjectProperties>
          <UseIIS>False</UseIIS>
          <AutoAssignPort>True</AutoAssignPort>
          <DevelopmentServerPort>49714</DevelopmentServerPort>
          <DevelopmentServerVPath>/</DevelopmentServerVPath>
          <IISUrl />
          <NTLMAuthentication>False</NTLMAuthentication>
          <UseCustomServer>False</UseCustomServer>
          <CustomServerUrl />
          <SaveServerSettingsInUserFile>False</SaveServerSettingsInUserFile>
        </WebProjectProperties>
      </FlavorProperties>
      <FlavorProperties Guid="{349c5851-65df-11da-9384-00065b846f21}" User="">
        <WebProjectProperties>
          <StartPageUrl>Default.aspx</StartPageUrl>
          <StartAction>SpecificPage</StartAction>
          <AspNetDebugging>True</AspNetDebugging>
          <SilverlightDebugging>False</SilverlightDebugging>
          <NativeDebugging>False</NativeDebugging>
          <SQLDebugging>False</SQLDebugging>
          <PublishCopyOption>RunFiles</PublishCopyOption>
          <PublishTargetLocation />
          <PublishDeleteAllFiles>False</PublishDeleteAllFiles>
          <PublishCopyAppData>True</PublishCopyAppData>
          <ExternalProgram />
          <StartExternalURL />
          <StartCmdLineArguments />
          <StartWorkingDirectory />
          <EnableENC>False</EnableENC>
          <AlwaysStartWebServerOnDebug>True</AlwaysStartWebServerOnDebug>
          <EnableWcfTestClientForSVC>False</EnableWcfTestClientForSVC>
        </WebProjectProperties>
      </FlavorProperties>
    </VisualStudio>
  </ProjectExtensions>
  <Import Project="$(MSBuildExtensionsPath)\RemObjects Software\Elements\RemObjects.Elements.Echoes.targets" />
  <Import Project="$(MSBuildExtensionsPath)\Microsoft\VisualStudio\v9.0\WebApplications\Microsoft.WebApplication.targets" />
</Project>