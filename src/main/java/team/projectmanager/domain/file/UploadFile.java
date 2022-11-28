package team.projectmanager.domain.file;

import lombok.AccessLevel;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Embeddable;

@Data
@Embeddable
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class UploadFile {

    private String originalFilename;

    private String storeFilename;

    public UploadFile(String originalFilename, String storeFilename) {
        this.originalFilename = originalFilename;
        this.storeFilename = storeFilename;
    }
}
