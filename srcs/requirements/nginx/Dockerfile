
# ADD ./conf/default.conf /etc/nginx/conf.d/default.conf
# ADD ./tools/certs /etc/ssl/certs/

FROM debian:buster

RUN apt-get -y update; \
    apt-get -y install nginx openssl; \
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/nginx.key \
    -out /etc/ssl/certs/nginx.crt \
    -subj "/C=TR/ST=Kocaeli/L=Kocaeli/O=Ecole42/OU=acetin/CN=acetin"

	# apt-get -y install apt install software-properties-common; \
	# apt-get -y install software-properties-common; \
	# add-apt-repository universe -y; \
	# apt-get update; \
	# apt-get -y install certbot python3-certbot-nginx


#certbot --nginx certonly -d acetin.42.fr; sertifika oluşturmak için	
# certbot renew --dry-run sertifikaları yenilemek için kullanılıyor

# COPY ./tools/ssl.sh /

# RUN bash ssl.sh

# RUN certbot --nginx certonly -d acetin.42.fr; \
# 	certbot renew --dry-run 


# openssl : Bu, OpenSSL sertifikaları, anahtarları ve diğer dosyaları oluşturmak ve yönetmek için kullanılan temel komut satırı aracıdır.

# req : Bu alt komut, X.509 sertifika imzalama isteği (CSR) yönetimini kullanmak istediğinizi belirtir. 
# “X.509”, SSL ve TLS'nin anahtar ve sertifika yönetimi için uyduğu bir genel anahtar altyapı standardıdır. 
# Yeni bir X.509 sertifikası oluşturmak istiyorsunuz, dolayısıyla bu alt komutu kullanıyorsunuz.

# -x509 : Bu, yardımcı programa normalde olduğu gibi bir sertifika imzalama isteği oluşturmak yerine
# kendinden imzalı bir sertifika yapmak istediğinizi söyleyerek önceki alt komutu daha da değiştirir.

# -nodes : Bu, OpenSSL'ye sertifikanızı bir parola ile koruma seçeneğini atlamasını söyler.
# Sunucu başladığında, kullanıcı müdahalesi olmadan dosyayı okuyabilmek için Nginx'e ihtiyacınız var.
# Parola bunun olmasını engeller çünkü her yeniden başlatmadan sonra parolayı girmeniz gerekir.

# -days 365 : Bu seçenek, sertifikanın geçerli sayılacağı süreyi belirler. Burada bir yıl için ayarladınız.

# -newkey rsa:2048 : Bu, aynı anda yeni bir sertifika ve yeni bir anahtar oluşturmak istediğinizi belirtir.
# Sertifikayı imzalamak için gerekli olan anahtarı önceki bir adımda oluşturmadınız, bu nedenle onu da sertifikayla birlikte oluşturmanız gerekiyor.
# "rsa:2048" 2048 bit uzunluğunda bir RSA anahtarı yapmasını söyler.

# -keyout : Bu satır, OpenSSL'ye oluşturduğunuz özel anahtar dosyasının nereye yerleştirileceğini söyler.

# -out : Bu, OpenSSL'ye oluşturduğunuz sertifikayı nereye yerleştireceğini söyler.
COPY ./conf/default.conf /etc/nginx/sites-enabled/default.conf
COPY ./conf/fastcgi_params /etc/nginx/fastcgi_params

RUN rm /etc/nginx/sites-enabled/default /etc/nginx/sites-available/default; \
	ln -s /etc/nginx/sites-enabled/default.conf /etc/nginx/sites-available/default.conf

# ADD ./tools/certs /etc/ssl/certs/


CMD ["nginx", "-g", "daemon off;"]