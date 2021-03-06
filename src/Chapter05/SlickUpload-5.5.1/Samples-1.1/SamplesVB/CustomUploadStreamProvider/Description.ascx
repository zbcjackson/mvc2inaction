<%@ Control Language="C#" %>
<%@ Register Assembly="Krystalware.SourceFormatter" Namespace="Krystalware.SourceFormatter"
    TagPrefix="kw" %>
<style type="text/css">
	<%= Krystalware.SourceFormatter.Source.SourceCss %>
</style>
<p>Not only can you use the built in File and SqlClient UploadStreamProviders, you can also create your own custom provider that returns a stream for SlickUpload to write files to. This
   allows you to do any stream transformations on the file &ndash; checksum, encrypt, etc.
</p>
<p>This sample demonstrates an UploadStreamProvider that zips all files as they are uploaded. The configuration is as follows:</p>
    <kw:Source Type="Html" runat="server"><uploadStreamProvider provider="Custom" location="~/CustomUploadStreamProvider/Files/" type="SamplesVB.CustomUploadStreamProvider.ZipUploadStreamProvider, SamplesVB" /></kw:Source>
<p>The heart of the UploadStreamProvider is the GetOutputStream method. SlickUpload calls this method for each file that is uploaded to get a stream to which to write the file. In this case,
   we create and return a zip stream:</p>
<kw:Source Type="VB" runat="server" ID="Source1">
    Public Function GetOutputStream(ByVal f As UploadedFile) As Stream Implements IUploadStreamProvider.GetOutputStream
        Dim fileS As FileStream = Nothing
        Dim zipS As ZipOutputStream = Nothing

        Try
            Dim outputPath As String = GetZipPath(f)

            Directory.CreateDirectory(Path.GetDirectoryName(outputPath))

            fileS = File.OpenWrite(outputPath)
            zipS = New ZipOutputStream(fileS)

            zipS.SetLevel(5)

            zipS.PutNextEntry(New ZipEntry(f.ClientName))

            f.LocationInfo(FileNameKey) = outputPath

            Return zipS
        Catch
            If Not fileS Is Nothing Then
                fileS.Close()
            End If

            If Not zipS Is Nothing Then
                zipS.Close()
            End If

            Return Nothing
        End Try
    End Function
</kw:Source>
<p>The GetInputStream is a mirror image of this method &ndash; it returns a stream with the contents of the file. This isn't required to be implemented
   if your code accesses the file data some other way, so you may throw a NotImplementedException from this method.</p>
<p>The RemoveOutput is the last method in the UploadStreamProvider and should remove anything created by the stream returned from the GetOutputStream
   method. It will be called if the upload fails or errors and needs to be cleaned up.</p>