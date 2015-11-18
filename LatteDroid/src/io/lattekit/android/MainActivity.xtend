package io.lattekit.android

import android.util.Log
import android.view.View
import android.view.View.OnClickListener
import android.widget.ImageView
import io.lattekit.Layout
import io.lattekit.ui.LatteActivity
import io.lattekit.ui.style.MainStylesheet
import io.lattekit.ui.style.Style
import io.lattekit.ui.view.LatteView
import java.util.List

class MainActivity extends LatteActivity implements OnClickListener {

	
	String myTitle = "Hello";
	String currentTheme = "mainTheme"
	var List<Integer> rowData = #[1,2,3,4,5];
	LatteView<ImageView> logoView;
	
	var Style testStyle = new Style => [
		borderColor = "#cccccc";
		backgroundColor = "#000000";
	];
	var String myBg = "#ffffff";
	var String myBgImage = null;
	var String theme = "light";
	var i = 0;

	@Layout(imports=#["io.lattekit.android", "android.support.v4.view"])
	override render() '''
		<LinearLayout cls={"container "+theme} orientation="vertical">
			
			<LinearLayout orientation="horizontal"  cls="topBar" style={{width:"match_parent"}}>
			</LinearLayout>
			for (i: 1 ..3) {
				<Button cls="mainButton" text={"Hi "+theme} style={{fontStyle: "bold-italic"}}  style={{marginLeft: "50dp"}} onClickListener={MainActivity.this} alignParentEnd={true}/>
			}
		
		</LinearLayout>
	'''

	override getCssFiles() {
		return #[new MainStylesheet()]
	}
	override onClick(View v) {
		myTitle ="WHAT IS UP";
		myBg = "#000000";
		theme = if (theme == "light") "dark" else "light";
		myBgImage = "ic_launcher";
		onStateChanged();
	}

}
