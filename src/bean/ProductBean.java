package bean;

public class ProductBean {
	private String pBrand;
	private String pName;
	private String pPrice;
	private String pImg;

	private String pCpu;
	private String pRamrom;
	private String pSize;
	private String pCamera;

	private String pTime;
	private String pBattery;
	private String pSim;
	private String pInterface;

	public ProductBean(String pBrand, String pName, String pPrice, String pImg, String pCpu, String pRamrom,
			String pSize, String pCamera, String pTime, String pBattery, String pSim, String pInterface) {
		super();
		this.pBrand = pBrand;
		this.pName = pName;
		this.pPrice = pPrice;
		this.pImg = pImg;

		this.pCpu = pCpu;
		this.pRamrom = pRamrom;
		this.pSize = pSize;
		this.pCamera = pCamera;

		this.pTime = pTime;
		this.pBattery = pBattery;
		this.pSim = pSim;
		this.pInterface = pInterface;
	}

	public String getpBrand() {
		return pBrand;
	}

	public void setpBrand(String pBrand) {
		this.pBrand = pBrand;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public String getpPrice() {
		return pPrice;
	}

	public void setpPrice(String pPrice) {
		this.pPrice = pPrice;
	}

	public String getpImg() {
		return pImg;
	}

	public void setpImg(String pImg) {
		this.pImg = pImg;
	}

	public String getpCpu() {
		return pCpu;
	}

	public void setpCpu(String pCpu) {
		this.pCpu = pCpu;
	}

	public String getpRamrom() {
		return pRamrom;
	}

	public void setpRamrom(String pRamrom) {
		this.pRamrom = pRamrom;
	}

	public String getpSize() {
		return pSize;
	}

	public void setpSize(String pSize) {
		this.pSize = pSize;
	}

	public String getpCamera() {
		return pCamera;
	}

	public void setpCamera(String pCamera) {
		this.pCamera = pCamera;
	}

	public String getpTime() {
		return pTime;
	}

	public void setpTime(String pTime) {
		this.pTime = pTime;
	}

	public String getpBattery() {
		return pBattery;
	}

	public void setpBattery(String pBattery) {
		this.pBattery = pBattery;
	}

	public String getpSim() {
		return pSim;
	}

	public void setpSim(String pSim) {
		this.pSim = pSim;
	}

	public String getpInterface() {
		return pInterface;
	}

	public void setpInterface(String pInterface) {
		this.pInterface = pInterface;
	}
}
