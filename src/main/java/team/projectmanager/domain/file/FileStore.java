package team.projectmanager.domain.file;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Component
public class FileStore {

    @Value("${file.dir}")
    private String fileDir;

    public UploadFile storeFile(MultipartFile multipartFile) {
        if (multipartFile != null) {
            String originalFilename = multipartFile.getOriginalFilename();
            String storeFilename = createStoreFilename(originalFilename);
            String fullPath = getFullPath(storeFilename);

            //IOException 잡아서 사용자 정의 Exception 으로 변경
            try {
                multipartFile.transferTo(new File(fullPath));
            } catch (IOException e) {
                return null;
            }

            return new UploadFile(originalFilename, storeFilename);
        } else return null;
    }

    public String getFullPath(String filename) {
        return fileDir + filename;
    }

    private String createStoreFilename(String originalFilename) {
        String ext = getExt(originalFilename);
        return UUID.randomUUID().toString() + ext;
    }

    private String getExt(String originalFilename) {
        int index = originalFilename.lastIndexOf(".");
        return originalFilename.substring(index);
    }
}
