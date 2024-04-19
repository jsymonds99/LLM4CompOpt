; ModuleID = 'hw2perf_unoptimized.ll'
source_filename = "hw2perf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"%lld\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [1000 x i64], align 16
  %2 = alloca [1000 x i64], align 16
  %3 = alloca [1000 x i64], align 16
  %4 = alloca [1000 x i64], align 16
  %scevgep = getelementptr i8, ptr %4, i64 8
  %scevgep26 = getelementptr i8, ptr %2, i64 8
  %scevgep32 = getelementptr i8, ptr %3, i64 8
  %scevgep36 = getelementptr i8, ptr %1, i64 8
  br label %5

5:                                                ; preds = %6, %0
  %lsr.iv30 = phi i64 [ %lsr.iv.next31, %6 ], [ 0, %0 ]
  %lsr.iv = phi i64 [ %lsr.iv.next, %6 ], [ 0, %0 ]
  %indvars.iv = phi i64 [ 0, %0 ], [ %indvars.iv.next.1, %6 ]
  %exitcond = icmp ne i64 %lsr.iv, 2000
  br i1 %exitcond, label %6, label %10

6:                                                ; preds = %5
  %7 = shl nuw nsw i64 %lsr.iv, 2
  %scevgep37 = getelementptr i8, ptr %scevgep36, i64 %7
  %scevgep38 = getelementptr i8, ptr %scevgep37, i64 -8
  store i64 %indvars.iv, ptr %scevgep38, align 8
  %scevgep27 = getelementptr i8, ptr %scevgep26, i64 %7
  %scevgep28 = getelementptr i8, ptr %scevgep27, i64 -8
  store i64 %lsr.iv, ptr %scevgep28, align 8
  %scevgep33 = getelementptr i8, ptr %scevgep32, i64 %7
  %scevgep34 = getelementptr i8, ptr %scevgep33, i64 -8
  store i64 %lsr.iv30, ptr %scevgep34, align 8
  %scevgep23 = getelementptr i8, ptr %scevgep, i64 %7
  %scevgep24 = getelementptr i8, ptr %scevgep23, i64 -8
  store i64 0, ptr %scevgep24, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  store i64 %indvars.iv.next, ptr %scevgep37, align 8
  %8 = add i64 %lsr.iv, 2
  store i64 %8, ptr %scevgep27, align 8
  %9 = add i64 %lsr.iv30, 3
  store i64 %9, ptr %scevgep33, align 8
  store i64 0, ptr %scevgep23, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %lsr.iv.next = add nuw nsw i64 %lsr.iv, 4
  %lsr.iv.next31 = add nuw nsw i64 %lsr.iv30, 6
  br label %5, !llvm.loop !6

10:                                               ; preds = %5
  call void @srand(i32 noundef 4) #3
  br label %11

11:                                               ; preds = %83, %10
  %indvars.iv15 = phi i64 [ %indvars.iv.next16, %83 ], [ 0, %10 ]
  %.06 = phi i32 [ 0, %10 ], [ %.3, %83 ]
  %.04 = phi i32 [ 15, %10 ], [ %.15, %83 ]
  %.0 = phi i32 [ 5, %10 ], [ %.1, %83 ]
  %exitcond18 = icmp ne i64 %indvars.iv15, 1000000000
  br i1 %exitcond18, label %12, label %.preheader

.preheader:                                       ; preds = %11
  br label %84

12:                                               ; preds = %11
  %13 = sext i32 %.0 to i64
  %14 = getelementptr inbounds [1000 x i64], ptr %1, i64 0, i64 %13
  %15 = load i64, ptr %14, align 8
  %16 = mul i64 %15, 87
  %17 = sdiv i64 %16, 4
  %18 = add nsw i64 %17, 23
  %19 = zext i32 %.04 to i64
  %20 = getelementptr inbounds [1000 x i64], ptr %2, i64 0, i64 %19
  %21 = load i64, ptr %20, align 8
  %22 = mul i64 %21, 231
  %23 = sdiv i64 %22, 3
  %24 = add nsw i64 %23, 59
  %25 = add nsw i64 %24, %18
  %26 = srem i64 %25, 1000
  %27 = getelementptr inbounds [1000 x i64], ptr %3, i64 0, i64 %26
  %28 = load i64, ptr %27, align 8
  %29 = add nsw i64 %15, %28
  %30 = add nsw i64 %29, %21
  %31 = mul nsw i64 %18, 11
  %32 = mul nsw i64 %24, 13
  %33 = mul nsw i64 %30, 17
  %34 = add i64 %33, %31
  %35 = add i64 %34, %32
  %36 = add nsw i64 %35, %indvars.iv15
  %37 = trunc i64 %indvars.iv15 to i32
  %.urem14 = urem i32 %37, 1000
  %38 = zext i32 %.urem14 to i64
  %39 = getelementptr inbounds [1000 x i64], ptr %4, i64 0, i64 %38
  store i64 %36, ptr %39, align 8
  %40 = icmp ult i64 %indvars.iv15, 100
  br i1 %40, label %.preheader8, label %83

.preheader8:                                      ; preds = %12
  br label %41

41:                                               ; preds = %.preheader8, %77
  %indvars.iv10 = phi i64 [ 0, %.preheader8 ], [ %indvars.iv.next11, %77 ]
  %.17 = phi i32 [ %.2, %77 ], [ %.06, %.preheader8 ]
  %lsr42 = trunc i64 %indvars.iv10 to i32
  %42 = udiv i32 %lsr42, 100
  %43 = mul nsw i32 %42, -100
  %44 = zext i32 %43 to i64
  %exitcond13 = icmp ne i64 %indvars.iv10, 1000000
  br i1 %exitcond13, label %45, label %78

45:                                               ; preds = %41
  %46 = zext i32 %.17 to i64
  %47 = getelementptr inbounds [1000 x i64], ptr %2, i64 0, i64 %46
  %48 = load i64, ptr %47, align 8
  %49 = mul nsw i64 %48, 6
  %50 = getelementptr inbounds [1000 x i64], ptr %3, i64 0, i64 %46
  %51 = load i64, ptr %50, align 8
  %52 = sdiv i64 %51, 2
  %53 = add nsw i64 %52, %49
  %54 = srem i64 %53, 1000
  %55 = getelementptr inbounds [1000 x i64], ptr %1, i64 0, i64 %54
  %56 = load i64, ptr %55, align 8
  %57 = shl nsw i64 %56, 1
  %58 = shl nsw i64 %48, 2
  %59 = add nsw i64 %58, %57
  %60 = srem i64 %59, 1000
  %61 = getelementptr inbounds [1000 x i64], ptr %3, i64 0, i64 %60
  %62 = load i64, ptr %61, align 16
  %63 = mul nsw i64 %62, 6
  %64 = getelementptr inbounds [1000 x i64], ptr %1, i64 0, i64 %46
  %65 = load i64, ptr %64, align 8
  %66 = mul nsw i64 %65, 3
  %67 = add nsw i64 %66, %63
  %68 = add nsw i64 %59, %53
  %69 = mul nsw i64 %67, 2
  %70 = add i64 %68, %69
  %71 = add i64 %indvars.iv10, %70
  %72 = add i64 %indvars.iv10, %44
  %tmp = trunc i64 %72 to i32
  %73 = sext i32 %tmp to i64
  %74 = getelementptr inbounds [1000 x i64], ptr %4, i64 0, i64 %73
  store i64 %71, ptr %74, align 8
  %75 = icmp ult i64 %indvars.iv10, 10
  br i1 %75, label %76, label %77

76:                                               ; preds = %45
  br label %77

77:                                               ; preds = %45, %76
  %.2 = phi i32 [ 59, %76 ], [ %.17, %45 ]
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  br label %41, !llvm.loop !8

78:                                               ; preds = %41
  %79 = icmp eq i64 %indvars.iv15, 0
  br i1 %79, label %80, label %83

80:                                               ; preds = %78
  %81 = call i32 @rand() #3
  %82 = srem i32 %81, 1000
  br label %83

83:                                               ; preds = %78, %12, %80
  %.3 = phi i32 [ %.17, %80 ], [ %.06, %12 ], [ %.17, %78 ]
  %.15 = phi i32 [ %.04, %80 ], [ %.04, %12 ], [ 37, %78 ]
  %.1 = phi i32 [ %82, %80 ], [ %.0, %12 ], [ %.0, %78 ]
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  br label %11, !llvm.loop !9

84:                                               ; preds = %.preheader, %85
  %indvars.iv19 = phi i64 [ 0, %.preheader ], [ %indvars.iv.next20, %85 ]
  %exitcond22 = icmp ne i64 %indvars.iv19, 1000
  br i1 %exitcond22, label %85, label %89

85:                                               ; preds = %84
  %86 = shl nuw nsw i64 %indvars.iv19, 3
  %scevgep43 = getelementptr i8, ptr %4, i64 %86
  %87 = load i64, ptr %scevgep43, align 8
  %88 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i64 noundef %87) #3
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  br label %84, !llvm.loop !10

89:                                               ; preds = %84
  ret i32 0
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #1

; Function Attrs: nounwind
declare i32 @rand() #1

declare i32 @printf(ptr noundef, ...) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.6"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
