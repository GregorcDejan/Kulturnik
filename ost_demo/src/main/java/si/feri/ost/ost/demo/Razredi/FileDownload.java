package si.feri.ost.ost.demo.Razredi;


    import java.io.InputStream;
import javax.faces.bean.ManagedBean;
import javax.faces.context.FacesContext;

import org.primefaces.model.DefaultStreamedContent;
import org.primefaces.model.StreamedContent;

    @ManagedBean
    public class FileDownload {

        private StreamedContent file;

        public FileDownload() {
            InputStream stream = FacesContext.getCurrentInstance().getExternalContext().getResourceAsStream("/resources/demo/images/optimus.jpg");
            file = new DefaultStreamedContent(stream, "image/jpg", "downloaded_optimus.jpg");
        }

        public StreamedContent getFile() {
            return file;
        }
    }

