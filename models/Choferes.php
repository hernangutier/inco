<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "choferes".
 *
 * @property int $id
 * @property string $cedrif
 * @property string $nombres
 * @property string $direccion
 *
 * @property Comisiones[] $comisiones
 */
class Choferes extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'choferes';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['cedrif'], 'string', 'max' => 20],
            [['nombres'], 'string', 'max' => 200],
            [['direccion'], 'string', 'max' => 400],
            [['cedrif'], 'unique'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'cedrif' => 'Cedrif',
            'nombres' => 'Nombres',
            'direccion' => 'Direccion',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getComisiones()
    {
        return $this->hasMany(Comisiones::className(), ['id_chof' => 'id']);
    }

    public function getDatosHtml(){
        $html='<div class="profile-user-info profile-user-info-striped">
												<div class="profile-info-row">
													<div class="profile-info-name"> Cedula </div>

													<div class="profile-info-value">
														<span class="editable editable-click" id="username">' . $this->cedrif . '</span>
													</div>
												</div>

												<div class="profile-info-row">
													<div class="profile-info-name"> Nombres y Apellidos </div>

													<div class="profile-info-value">
														<i class="fa fa-map-marker light-orange bigger-110"></i>
														<span class="editable editable-click" id="country">'. $this->nombres .'</span>
														<span class="editable editable-click" id="city">Amsterdam</span>
													</div>
												</div>







												
											</div>';
                return $html;
    }
}
