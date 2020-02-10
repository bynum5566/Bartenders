package bar.model;
import okhttp3.RequestBody;
import retrofit2.Call;
import retrofit2.http.Body;
import retrofit2.http.Header;
import retrofit2.http.Headers;
import retrofit2.http.POST;
import retrofit2.http.Query;


public interface ImgurAPI {
    String SERVER = "https://api.imgur.com";
    public static final String AUTH = "6676c6a29041d49";

    @Headers("Authorization: Client-ID " + AUTH)
    @POST("/3/upload")
    Call<ImageResponse> postImage(
            @Body RequestBody image
    );
    
}